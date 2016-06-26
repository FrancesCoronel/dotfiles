import sys
import argparse
from workflow import Workflow, web, PasswordNotFound


def slack_keys():
    wf_password = Workflow()
    try:
        slack_keys = wf_password.get_password('slack_api_key')
    except PasswordNotFound:
        wf.add_item(title='No API key set. Please run slt',
                    valid=False)
        wf.send_feedback()
        return 0
    keys = slack_keys.split(",")

    return keys


def slack_files(keys):

    files_list = []

    for key in keys:
        api_key = str(key)
        slack_auth = web.get('https://slack.com/api/auth.test?token=' + api_key + '&pretty=1').json()
        if slack_auth['ok'] is False:
            wf.add_item('Authentication failed.'
                        'Try saving your API key again',
                        valid=False)
            wf.send_feedback()
            break
        else:
            files = web.get('https://slack.com/api/files.list?token=' + api_key + '&count=20&pretty=1').json()
            for file in files['files']:
                if 'initial_comment' in file:
                    files_list.append({'name': file['name'], 'id': file['id'], 'url': file['permalink'], 'title':
                        file['title'], 'filetype': file['filetype'], 'initial_comment': file['initial_comment'],
                                       'comment': file['initial_comment']['comment']})
                else:
                    files_list.append({'name': file['name'], 'id': file['id'], 'url': file['url'], 'title':
                        file['title'], 'filetype': file['filetype']})

    return files_list


def search_slack_files(files):
    elements = []
    elements.append(files['name'])
    return u' '.join(elements)


def main(wf):

    parser = argparse.ArgumentParser()
    parser.add_argument('query', nargs='?', default=None)
    args = parser.parse_args(wf.args)

    query = args.query

    def wrapper():
        return slack_files(keys=slack_keys())

    files_to_list = wf.cached_data('files', wrapper, max_age=120)

    if query:
        files_to_list = wf.filter(query, files_to_list, key=search_slack_files)

    for files in files_to_list:
        if 'initial_comment' in files_to_list:
            wf.add_item(title=files['name'],
                subtitle=files['comment'],
                arg=files['url'],
                valid=True)
        else:
            wf.add_item(title=files['name'],
                arg=files['url'],
                valid=True)

    wf.send_feedback()

if __name__ == u"__main__":
    wf = Workflow()
    sys.exit(wf.run(main))