import sys
import argparse
import requests
from workflow import Workflow, web, PasswordNotFound


def slack_keys():
    wf = Workflow()
    try:
        slack_keys = wf.get_password('slack_api_key')
    except PasswordNotFound:
        wf.add_item(title='No API key set. Please run slt',
                    valid=False)
        wf.send_feedback()
        return 0
    keys = slack_keys.split(",")

    return keys

def search_slack(keys, query):
    wf = Workflow()
    search_results = []
    for key in keys:
        api_key = str(key)
        slack_auth = web.get('https://slack.com/api/auth.test?token=' + api_key + '&pretty=1').json()
        if slack_auth['ok'] is False:
            wf.add_item('Authentication failed.'
                        'Try saving your API key again',
                        valid=False)
            wf.send_feedback()
        else:
            results = web.get('https://slack.com/api/search.messages?token=' + api_key + '&query=' + query +
                              '&count=10&pretty=1').json()
            if results['messages']['total'] > 0:
                for result in results['messages']['matches']:
                    if result['type'] == 'message':
                        search_results.append({'text': result['text'], 'channel': result['channel']['name'],
                                               'user': result['username'], 'team': slack_auth['team'],
                                               'link': result['permalink']})
            else:
                search_results.append({'text': 'False', 'team': slack_auth['team']})

    return search_results

def main(wf):

    parser = argparse.ArgumentParser()
    parser.add_argument('query', nargs='?', default=None)
    args = parser.parse_args(wf.args)

    query = args.query

    search_results = search_slack(keys=slack_keys(), query=query)

    for results in search_results:
        if results['text'] == 'False':
            wf.add_item(title='No search results found',
                        subtitle=results['team'],
                        valid=False)
        else:
            wf.add_item(title=results['text'],
                        subtitle='%s - %s - %s' % (results['user'], results['channel'], results['team']),
                        arg=results['link'],
                        valid=True)

    wf.send_feedback()

if __name__ == u"__main__":
    wf = Workflow()
    sys.exit(wf.run(main))