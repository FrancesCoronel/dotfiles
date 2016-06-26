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


def my_slack_info(keys):
    wf = Workflow()
    my_info = []

    for key in keys:
        api_key = str(key)
        slack_user_info = web.get('https://slack.com/api/auth.test?token=' + api_key + '&pretty=1').json()
        if slack_user_info['ok'] is False:
            wf.add_item(title='Authenticantion failed. Please check your API keys.',
                        valid=False)
            wf.send_feedback()
        else:
            my_info.append({'team': slack_user_info['team'], 'user': slack_user_info['user'], 'team_id':
                slack_user_info['team_id']})

    return my_info

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

    return channels_list


def my_slack_stars(keys):

    stars_list = []
    channels = slack_channels(keys=slack_keys())

    for key in keys:
        api_key = str(key)
        slack_stars_list = web.get('https://slack.com/api/stars.list?token=' + api_key + '&pretty=1').json()
        for stars in slack_stars_list['items']:
            if 'file' in stars['type']:
                for channel in channels:
                    if stars['file']['channels'] == channel['id']:
                        stars_list.append({'type': stars['type'], 'message': stars['file']['name'], 'channel':
                            channels['name'], 'link': stars['file']['permalink']})
            elif 'message' in stars['type']:
                    for channel in channels:
                        if stars['channel'] == channel['id']:
                            stars_list.append({'type': stars['type'], 'message': stars['message']['text'], 'channel':
                                channel['name'], 'link': stars['message']['permalink']})

    return stars_list

def search_slack_stars(stars):
    elements = []
    elements.append(stars['message'])
    return u' '.join(elements)


def main(wf):

    parser = argparse.ArgumentParser()
    parser.add_argument('query', nargs='?', default=None)
    args = parser.parse_args(wf.args)

    query = args.query

    def wrapper():
        return my_slack_stars(keys=slack_keys())

    stars_to_list = wf.cached_data('stars', wrapper, max_age=10)

    if query:
        stars_to_list = wf.filter(query, stars_to_list, key=search_slack_stars)

    for stars in stars_to_list:
        wf.add_item(title=stars['message'],
                subtitle=stars['channel'],
                arg=stars['link'],
                valid=True)

    wf.send_feedback()

if __name__ == u"__main__":
    wf = Workflow()
    sys.exit(wf.run(main))