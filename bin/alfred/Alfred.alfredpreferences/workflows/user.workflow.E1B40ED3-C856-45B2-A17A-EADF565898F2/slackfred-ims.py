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
            wf.add_item(title='Authentication failed. Please check your API keys.',
                        valid=False)
            wf.send_feedback()
        else:
            my_info.append({'team': slack_user_info['team'], 'user': slack_user_info['user'], 'team_id':
                slack_user_info['team_id']})

    return my_info


def slack_user_list(keys):

    users_list = []

    for key in keys:
        api_key = str(key)
        slack_users_list = web.get('https://slack.com/api/users.list?token=' + api_key + '&pretty=1').json()
        for member in slack_users_list['members']:
            users_list.append({'id': member['id'], 'name': member['name']})

    return users_list


def search_slack_users(users):
    elements = []
    elements.append(users['name'])
    return u' '.join(elements)


def slack_im_list(keys):

    im_list = []

    for key in keys:
        api_key = str(key)
        list_of_ims = web.get('https://slack.com/api/im.list?token=' + api_key + '&pretty=1').json()
        for im in list_of_ims['ims']:
            im_list.append({'id': im['id'], 'user': im['user']})

    return im_list


def slack_im_history(keys, im_user_id):
    im_messages = ''
    for key in keys:
        api_key = str(key)
        im_history = web.get('https://slack.com/api/im.history?token=' + api_key + '&channel=' + im_user_id +
                             '&pretty=1').json()
        if im_history['ok'] is True:
            im_messages = im_history['messages']

    return im_messages


def main(wf):

    parser = argparse.ArgumentParser()
    parser.add_argument('query', nargs='?', default=None)
    args = parser.parse_args(wf.args)

    query = args.query

    my_info = my_slack_info(keys=slack_keys())
    im_info = slack_im_list(keys=slack_keys())

    def wrapper():
        return slack_user_list(keys=slack_keys())

    users_to_list = wf.cached_data('users', wrapper, max_age=120)

    if query:
        users_to_list = wf.filter(query, users_to_list, key=search_slack_users)

    im_user_id = ''
    for user in users_to_list:
        if query == user['name']:
            for ims in im_info:
                if ims['user'] == user['id']:
                    im_user_id = ims['id']

    ims = slack_im_history(keys=slack_keys(), im_user_id=im_user_id)

    for im in ims:
        wf.add_item(title=im['text'],
                         valid=False)
    wf.send_feedback()


if __name__ == u"__main__":
    wf = Workflow()
    sys.exit(wf.run(main))