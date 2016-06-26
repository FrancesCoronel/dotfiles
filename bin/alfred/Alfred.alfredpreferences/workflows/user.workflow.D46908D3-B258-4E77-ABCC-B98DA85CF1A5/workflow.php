<?php

require 'item.php';
require 'curl.php';

class Workflow
{
    const VERSION = 'becfdd7ad2557d6eadd0f4befc30ee5f9c9bb687';
    const BUNDLE = 'de.gh01.alfred.github-dev';
    const DEFAULT_CACHE_MAX_AGE = 10;

    private static $filePids;

    /** @var PDO */
    private static $db;
    /** @var PDOStatement[] */
    private static $statements = array();

    private static $query;
    private static $items = array();

    private static $refreshUrls = array();

    public static function init($query = null)
    {
        date_default_timezone_set('UTC');
        self::$query = $query;
        if (isset($_ENV['alfred_workflow_data'])) {
            $dataDir = $_ENV['alfred_workflow_data'];
        } else {
            $dataDir = (isset($_ENV['HOME']) ? $_ENV['HOME'] : $_SERVER['HOME']) . '/Library/Application Support/Alfred 2/Workflow Data/' . self::BUNDLE;
            $_ENV['alfred_workflow_data'] = $dataDir;
        }
        if (!is_dir($dataDir)) {
            mkdir($dataDir);
        }
        self::$filePids = $dataDir . '/pid';
        $fileDb = $dataDir . '/db.sqlite';
        $exists = file_exists($fileDb);
        self::$db = new PDO('sqlite:' . $fileDb, null, null);
        if (!$exists) {
            self::$db->exec('
                CREATE TABLE config (
                    key TEXT PRIMARY KEY,
                    value TEXT
                )
            ');
            self::createRequestCacheTable();
        }
        register_shutdown_function(array(__CLASS__, 'shutdown'));
    }

    public static function shutdown()
    {
        if (self::$refreshUrls) {
            exec('php action.php "> refresh-cache ' . implode(',', self::$refreshUrls) . '" > /dev/null 2>&1 &');
        }
    }

    public static function setConfig($key, $value)
    {
        self::getStatement('REPLACE INTO config VALUES(?, ?)')->execute(array($key, $value));
    }

    public static function getConfig($key, $default = null)
    {
        $stmt = self::getStatement('SELECT value FROM config WHERE key = ?');
        $stmt->execute(array($key));
        $value = $stmt->fetchColumn();
        return false !== $value ? $value : $default;
    }

    public static function removeConfig($key)
    {
        self::getStatement('DELETE FROM config WHERE key = ?')->execute(array($key));
    }

    public static function request($url, Curl $curl = null, $callback = null)
    {
        $return = false;
        $returnValue = null;
        if (!$curl) {
            $curl = new Curl();
            $return = true;
            $callback = function ($content) use (&$returnValue) {
                $returnValue = $content;
            };
        }

        $curl->add(new CurlRequest($url, null, function (CurlResponse $response) use ($callback) {
            if (is_callable($callback) && isset($response->content)) {
                $callback($response->content);
            }
        }));

        if ($return) {
            $curl->execute();
        }
        return $returnValue;
    }

    public static function requestCache($url, Curl $curl = null, $callback = null, $maxAge = self::DEFAULT_CACHE_MAX_AGE, $refreshInBackground = true)
    {
        $return = false;
        $returnValue = null;
        if (!$curl) {
            $curl = new Curl();
            $return = true;
            $callback = function ($content) use (&$returnValue) {
                $returnValue = $content;
            };
        }

        $stmt = self::getStatement('SELECT * FROM request_cache WHERE url = ?');
        $stmt->execute(array($url));
        $stmt->bindColumn('timestamp', $timestamp);
        $stmt->bindColumn('etag', $etag);
        $stmt->bindColumn('content', $content);
        $stmt->bindColumn('refresh', $refresh);
        $stmt->fetch(PDO::FETCH_BOUND);

        $shouldRefresh = $timestamp < time() - 60 * $maxAge;
        $refreshInBackground = $refreshInBackground && !is_null($content);

        if ($shouldRefresh && $refreshInBackground && $refresh < time() - 60) {
            self::getStatement('UPDATE request_cache SET refresh = ? WHERE url = ?')->execute(array(time(), $url));
            self::$refreshUrls[] = $url;
        }

        if (!$shouldRefresh || $refreshInBackground) {
            $content = json_decode($content);
            $stmt = self::getStatement('SELECT url, content FROM request_cache WHERE parent = ? ORDER BY `timestamp` DESC');
            while ($stmt->execute(array($url)) && $data = $stmt->fetchObject()) {
                $content = array_merge($content, json_decode($data->content));
                $url = $data->url;
            }
            if (is_callable($callback)) {
                $callback($content);
            }
            return $returnValue;
        }

        $responses = array();

        $handleResponse = function (CurlResponse $response, $content, $parent = null) use (&$handleResponse, $curl, &$responses, $stmt, $callback) {
            $url = $response->request->url;
            if ($response && in_array($response->status, array(200, 304))) {
                $checkNext = false;
                if (304 == $response->status) {
                    $response->content = $content;
                    $checkNext = true;
                } elseif (false === stripos($response->contentType, 'json')) {
                    $response->content = json_encode($response->content);
                }
                $responses[] = $response->content;
                Workflow::getStatement('REPLACE INTO request_cache VALUES(?, ?, ?, ?, 0, ?)')
                    ->execute(array($url, time(), $response->etag, $response->content, $parent));
                if ($checkNext || $response->link && preg_match('/<(.+)>; rel="next"/U', $response->link, $match)) {
                    $stmt = Workflow::getStatement('SELECT * FROM request_cache WHERE parent = ?');
                    $stmt->execute(array($url));
                    if ($checkNext) {
                        $stmt->bindColumn('url', $nextUrl);
                    } else {
                        $nextUrl = $match[1];
                    }
                    $stmt->bindColumn('etag', $etag);
                    $stmt->bindColumn('content', $content);
                    $stmt->fetch(PDO::FETCH_BOUND);
                    if ($nextUrl) {
                        $curl->add(new CurlRequest($nextUrl, $etag, function (CurlResponse $response) use ($handleResponse, $url, $content) {
                            $handleResponse($response, $content, $url);
                        }));
                        return;
                    }
                } else {
                    Workflow::getStatement('DELETE FROM request_cache WHERE parent = ?')->execute(array($url));
                }
            } else {
                Workflow::getStatement('DELETE FROM request_cache WHERE url = ?')->execute(array($url));
                $url = null;
            }

            if (is_callable($callback)) {
                if (empty($responses)) {
                    $callback(array());
                    return;
                }
                if (1 === count($responses)) {
                    $callback(json_decode($responses[0]));
                    return;
                }
                $callback(array_reduce($responses, function ($content, $response) {
                    return array_merge($content, json_decode($response));
                }, array()));
            }
        };

        $curl->add(new CurlRequest($url, $etag, function (CurlResponse $response) use (&$responses, $handleResponse, $callback, $content) {
            $handleResponse($response, $content);
        }));

        if ($return) {
            $curl->execute();
        }
        return $returnValue;
    }

    public static function requestGithubApi($url, Curl $curl = null, $callback = null, $maxAge = self::DEFAULT_CACHE_MAX_AGE)
    {
        $paramStart = false === strpos($url, '?') ? '?' : '&';
        $url = 'https://api.github.com' . $url . $paramStart . 'per_page=100';
        return self::requestCache($url, $curl, $callback, $maxAge);
    }

    public static function cleanCache()
    {
        self::$db->exec('DELETE FROM request_cache WHERE timestamp < ' . (time() - 30 * 24 * 60 * 60));
    }

    public static function deleteCache()
    {
        self::$db->exec('DELETE FROM request_cache');
    }

    public static function startServer()
    {
        if (version_compare(PHP_VERSION, '5.4', '>=')) {
            self::stopServer();
            shell_exec(sprintf(
                'alfred_workflow_data=%s php -d variables_order=EGPCS -S localhost:2233 server.php > /dev/null 2>&1 & echo $! >> %s',
                escapeshellarg($_ENV['alfred_workflow_data']),
                escapeshellarg(self::$filePids)
            ));
        }
    }

    public static function stopServer()
    {
        if (file_exists(self::$filePids)) {
            $pids = file(self::$filePids);
            foreach ($pids as $pid) {
                shell_exec('kill -9 ' . $pid);
            }
            unlink(self::$filePids);
        }
    }

    public static function checkUpdate()
    {
        if (self::getConfig('version') !== self::VERSION) {
            self::setConfig('version', self::VERSION);
            //self::deleteCache();
            self::closeCursors();
            self::$db->exec('DROP TABLE request_cache');
            self::createRequestCacheTable();
        }
        if (!self::getConfig('autoupdate', 1)) {
            return false;
        } elseif (!is_dir(__DIR__ . '/icons')) {
            return true;
        }
        $version = self::requestCache('http://gh01.de/alfred/github/current', null, null, 1440);
        return $version !== null && $version !== self::VERSION;
    }

    private static function createRequestCacheTable()
    {
        self::$db->exec('
            CREATE TABLE request_cache (
                url TEXT PRIMARY KEY,
                timestamp INTEGER,
                etag TEXT,
                content TEXT,
                refresh INTEGER,
                parent TEXT
            )
        ');
    }

    public static function addItem(Item $item, $check = true)
    {
        if (!$check || $item->match(self::$query)) {
            self::$items[] = $item;
        }
    }

    public static function sortItems()
    {
        usort(self::$items, function (Item $a, Item $b) {
            return $a->compare($b);
        });
    }

    public static function getItemsAsXml()
    {
        return Item::toXml(self::$items);
    }

    /**
     * @param string $query
     * @return PDOStatement
     */
    public static function getStatement($query)
    {
        if (!isset(self::$statements[$query])) {
            self::$statements[$query] = self::$db->prepare($query);
        }
        return self::$statements[$query];
    }

    protected static function closeCursors()
    {
        foreach (self::$statements as $statement) {
            $statement->closeCursor();
        }
        self::$statements = array();
    }
}
