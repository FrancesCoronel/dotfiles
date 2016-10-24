<?php
// Include SimpleHTMLDOM class
require('simplehtmldom.php');

// Init empty array
$dongers = array();
$categories = array();
$debug = false;

/**
 * Function to optionally output debug messages
 * @param  {String} $msg input message
 * @return void
 */
function debug($msg){
  global $debug;

  if ($debug) {
    echo($msg);
  }
}

/*
 * Parse available categories
 */

// Initial request to parse available categories
$html = file_get_html('http://dongerlist.com');

// Store DOM in variable
$parsed_categories = $html->find('a.list-2-anchor');

// Push to array
foreach ($parsed_categories as $parsed_category) {
  // Push all elements except the "All" one to array
  if ($parsed_category->plaintext != "All") {
    array_push($categories, strtolower($parsed_category->plaintext));
  }
}

/*
 * Parse dongers per category
 */

// For each available category
foreach ($categories as $category) {
  debug('Starting to parse category "'. $category."\"\r\n");

  // Create empty array to store dongers for current categorie
  $dongerSet = array();

  // Parse available pages for specific cateogory
  $html = file_get_html('http://dongerlist.com/category/'.$category);

  // Parse avaiable pagination infos and store current and last page in variable
  $page = trim($html->find('.wp-pagenavi .current', 0)->plaintext);
  $pages = $html->find('.wp-pagenavi .page');

  // If pages contain elements ...
  if ($pages) {
    // ... use the last one as last page
    $last_page = trim(end($pages)->plaintext);
  } else {
    // ... otherwise, there are no additional pages, use the current page as last page
    $last_page = $page;
  }

  // As long as we didn't reach last page
  while ($page <= $last_page) {
    debug('- parsing page '.$page.'/'.$last_page."\n");
    $html = file_get_html('http://dongerlist.com/category/'.$category.'/page/'.$page);
    // Search each donger on the current page
    foreach($html->find('.list-1-item') as $donger) {
      // Create tiny array per each donger to save meta data like category
      array_push($dongerSet, html_entity_decode($donger->find('.donger', 0)->plaintext));
    }
    // Continue with next page
    $page++;
  }

  // Push category set into $dongers array
  $dongers[$category] = $dongerSet;
}

// Encode as json
echo json_encode($dongers);

?>
