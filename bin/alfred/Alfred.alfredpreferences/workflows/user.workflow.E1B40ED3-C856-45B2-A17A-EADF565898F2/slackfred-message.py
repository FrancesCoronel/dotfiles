import sys
import argparse
import subprocess
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


def slack_channels(keys):
    channels_list = []
    for key in keys:
        api_key = str(key)
        slack_auth = web.get('https://slack.com/api/auth.test?token=' + api_key + '&pretty=1').json()
        if slack_auth['ok'] is False:
            wf.add_item(title='Authentication failed. Check your API key',
                        valid=False)
            wf.send_feedback()
            break
        else:
            channels = web.get('https://slack.com/api/channels.list?token=' + api_key + '&count=50&pretty=1').json()
            for channel in channels['channels']:
                channels_list.append({'team': slack_auth['team'],'name': channel['name'], 'member': channel['is_member']
                    , 'id': channel['id']})
            groups = web.get('https://slack.com/api/groups.list?token=' + api_key + '&exclude_archived=1&pretty=1')\
                .json()
            for group in groups['groups']:
                if 'id' in group:
                    channels_list.append({'team': slack_auth['team'], 'name': group['name'], 'member': True,
                                          'id': group['id']})

    return channels_list


def search_slack_channels(channels):
    elements = []
    elements.append(channels['name'])
    return u' '.join(elements)


def main(wf):

    parser = argparse.ArgumentParser()
    parser.add_argument('--message', nargs='?')
    parser.add_argument('query', nargs='?', default=None)
    args = parser.parse_args(wf.args)

    if args.message:
        query = args.message
        split_message = query.split()
        channel_name = split_message[0]
        if len(split_message) == 3:
            message = split_message[2]
        else:
            message = '%20'.join(split_message[2:])
        for key in slack_keys():
                api_key = str(key)
                slack_auth = web.get('https://slack.com/api/auth.test?token=' + api_key + '&pretty=1').json()
                if slack_auth['ok'] is True:
                    message_url = 'https://slack.com/api/chat.postMessage?token=' + api_key + '&channel=%23' + channel_name + '&text=' + message + '&as_user=true&pretty=1'
                    web.get(message_url)


    def wrapper():
        return slack_channels(keys=slack_keys())

    channels_list = wf.cached_data('channels', wrapper, max_age=120)

    query = args.query

    if query:
        channels_list = wf.filter(query, channels_list, key=search_slack_channels)

    if len(channels_list) == 0:
        wf.add_item(title="Enter your message",
                    arg=query,
                    valid=True)
    else:
        for channels in channels_list:
            if channels['member'] == True:
                wf.add_item(title=channels['name']+' - '+channels['team'],
                    subtitle='Member',
                    autocomplete=channels['name'] + ' > ',
                    arg=query,
                    valid=True)

    wf.send_feedback()

if __name__ == u"__main__":
    wf = Workflow()
    sys.exit(wf.run(main))