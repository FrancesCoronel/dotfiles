import sys
import argparse
from workflow import Workflow, web, PasswordNotFound
import json
import webbrowser

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


def slack_list(keys):
    wf = Workflow()
    slack_search = []

    for key in keys:
        api_key = str(key)
        slack_auth = web.get('https://slack.com/api/auth.test?token=' + api_key + '&pretty=1').json()
        if slack_auth['ok'] is False:
            wf.add_item(title='Authentication failed. Check your API key',
                        valid=False)
            wf.send_feedback()
            break
        else:
            slack_channels = web.get('https://slack.com/api/channels.list?token=' + api_key +
                                     '&exclude_archived=1&pretty=1').json()
            slack_users = web.get('https://slack.com/api/users.list?token=' + api_key + '&pretty=1').json()
            slack_groups = web.get('https://slack.com/api/groups.list?token=' + api_key + '&pretty=1').json()
            for channels in slack_channels['channels']:
                slack_search.append({'name': channels['name'], 'team': slack_auth['team'],'team_id': slack_auth['team_id'], 'id': channels['id'], 'type': 'channel', 'api_key': api_key})
            for users in slack_users['members']:
                slack_search.append({'name': users['name'], 'team': slack_auth['team'],'team_id': slack_auth['team_id'], 'id': users['id'], 'type': 'user', 'api_key': api_key})
            for groups in slack_groups['groups']:
                if 'name' in groups:
                    slack_search.append({'name': groups['name'], 'team': slack_auth['team'],'team_id': slack_auth['team_id'], 'id': groups['id'], 'type': 'group', 'api_key': api_key})
    return slack_search


def search_slack_names(slack_list):
    elements = []
    elements.append(slack_list['name'])
    return u' '.join(elements)

def slack_urlopen(target_json):
    slack_target = json.loads(target_json)
    url = ""
    if slack_target['type'] != 'user':
        url = "slack://channel?id=" + slack_target['id'] + "&team=" + slack_target['team_id']
    elif slack_target['type'] == 'user':
        im_id = web.get('https://slack.com/api/im.open?token=' + slack_target['api_key'] +
                                 '&user=' + slack_target['id']).json()['channel']['id']
        url = "slack://channel?id=" + im_id + "&team=" + slack_target['team_id']

    return url


def main(wf):

    parser = argparse.ArgumentParser()
    parser.add_argument('--setkey', dest='apikey', nargs='?', default=None)
    parser.add_argument('--open', dest='open', nargs='?')
    parser.add_argument('query', nargs='?', default = None)
    args = parser.parse_args(wf.args)


    if args.apikey:
        wf.save_password('slack_api_key', args.apikey)
        return 0

    if args.open:
        url = slack_urlopen(wf.args[1])
        webbrowser.open(url)
        return

    if len(wf.args):
        query=wf.args[0]
    else:
        query=None

    def wrapper():
        return slack_list(keys=slack_keys())

    slack_search = wf.cached_data('slackfred', wrapper, max_age=120)

    if query:
        slack_search = wf.filter(query, slack_search, key=search_slack_names)

    for names in slack_search:
        wf.add_item(title=names['name'],
                    subtitle=names['team'],
                    arg=json.dumps(names),
                    valid=True)

    wf.send_feedback()

if __name__ == u"__main__":
    wf = Workflow()
    sys.exit(wf.run(main))
