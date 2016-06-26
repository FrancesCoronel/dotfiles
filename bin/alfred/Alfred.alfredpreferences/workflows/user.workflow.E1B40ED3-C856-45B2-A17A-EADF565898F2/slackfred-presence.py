import sys
import argparse
from workflow import Workflow, ICON_WEB, web, PasswordNotFound

def main(wf):

    parser = argparse.ArgumentParser()
    parser.add_argument('query', nargs='?', default = None)
    args = parser.parse_args(wf.args)

    try:
        slack_keys = wf.get_password('slack_api_key')
    except PasswordNotFound:
        wf.add_item(title='No API key set. Please run slt',
                    valid=False)
        wf.send_feedback()
        return 0
    keys = slack_keys.split(",")

    if len(wf.args):
        query = wf.args[0]
    else:
        query = None

    for key in keys:
        api_key = str(key)
        slack_auth = web.get('https://slack.com/api/auth.test?token=' + api_key + '&pretty=1').json()
        if slack_auth['ok'] is False:
            wf.add_item(title='Authentication failed. Check your API key',
                        valid=False)
            wf.send_feedback()
        else:
            web.get('https://slack.com/api/users.setPresence?token=' + api_key + '&presence=' + query + '&pretty=1')

    wf.send_feedback()

if __name__ == u"__main__":
    wf = Workflow()
    sys.exit(wf.run(main))