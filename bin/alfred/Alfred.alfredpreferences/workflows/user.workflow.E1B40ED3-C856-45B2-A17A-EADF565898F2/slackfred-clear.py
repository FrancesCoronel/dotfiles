import sys
import argparse
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

def clear_messages(keys):
    for key in keys:
        api_key = str(key)
        slack_auth = web.get('https://slack.com/api/auth.test?token=' + api_key + '&pretty=1').json()
        if slack_auth['ok'] is False:
            wf.add_item(title='Authentication failed. Check your API key',
                        valid=False)
            wf.send_feedback()

        slack_channels = web.get('https://slack.com/api/channels.list?token=' + api_key + '&pretty=1').json()
        for channel in slack_channels['channels']:
            if channel['is_member'] is True:
                channel_id = channel['id']
                channel_history = web.get('https://slack.com/api/channels.history?token=' + api_key + '&channel='
                                      + channel_id + '&pretty=1').json()
                last_message = channel_history['messages'][0]['ts']
                web.get('https://slack.com/api/channels.mark?token=' + api_key + '&channel=' + channel_id +
                        '&ts=' + last_message +'&pretty1')

def main(wf):
    clear_messages(keys=slack_keys())

    wf.send_feedback()

if __name__ == u"__main__":
    wf = Workflow()
    sys.exit(wf.run(main))