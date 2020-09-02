# -*- coding: utf-8 -*-

import sys
from workflow import Workflow3
import urllib2, sys
import shutil
from workflow.notify import notify
from bs4 import BeautifulSoup
import base64

RUNWAY_URL  = 'http://ourairports.com/data/runways.csv'
AIRPORT_URL = 'http://ourairports.com/data/airports.csv'
FRQ_URL     = 'http://ourairports.com/data/airport-frequencies.csv'
NAVAID_URL  = 'http://ourairports.com/data/navaids.csv'

BETA_EMOJI = 'http://unicode.org/emoji/charts-beta/full-emoji-list.html'
BETA_SKIN = 'http://unicode.org/emoji/charts-beta/full-emoji-modifiers.html'

EMOJI = 'http://unicode.org/emoji/charts/full-emoji-list.html'
SKIN = 'http://unicode.org/emoji/charts/full-emoji-modifiers.html'


def main(wf):

    file_count = 0
    wf.store_data('emoji_count', 0)
    wf.store_data('phase', 'downloading')
    wf.store_data('download_progress', "%d/2" % file_count)

    for url in [BETA_EMOJI, BETA_SKIN]:
        file_count += 1
        file_name = url.split('/')[-1]
        wf.store_data('download_progress', "%d/2" % file_count)
        wf.store_data('download_file', file_name)
        download_file(url, file_name)

    wf.store_data('phase', 'processing')
    parseFiles()

    wf.store_data('phase', 'done')

def parseFiles():
    log.info("Parsing Downloaded Files")
    log.info('Creating DataFileBuilder')

    # Open the output file
    csv = open('emoji.tab', 'w')

    msg = u'Converting emoji data'
    parse_html_file(csv, 'full-emoji-list.html', msg)
    msg = u'Converting skin-tone data'
    parse_html_file(csv, 'full-emoji-modifiers.html', msg)

    emoji_count = wf.stored_data('emoji_count')
    notify(title=u'Emoji Taco', text=u'Is ready for use. {} emoji processed'.format(emoji_count), sound=None)


def download_file(url, file_name):

    file_url = url.lower()

    log.info("Downloading " + file_url)
    temp_filename = file_name + '.tmp'

    f = open(temp_filename, 'wb')
    remote_file = urllib2.urlopen(file_url)

    try:
        total_size = remote_file.info().getheader('Content-Length').strip()
        header = True
    except AttributeError:
        header = False  # a response doesn't always include the "Content-Length" header

    if header:
        total_size = int(total_size)

    bytes_so_far = 0

    while True:
        buffer = remote_file.read(1024)
        if not buffer:
            sys.stdout.write('\n')
            break

        bytes_so_far += len(buffer)
        f.write(buffer)
        if not header:
            total_size = bytes_so_far  # unknown size

        percent = float(bytes_so_far) / total_size
        percent = round(percent * 100, 2)
        log.info("%s Downloaded %d of %d bytes %0.2f%%\r" % (file_name, bytes_so_far, total_size, percent))
        #sys.stdout.write("Downloaded %d of %d bytes (%0.2f%%)\r" % (bytes_so_far, total_size, percent))
        print percent
        wf.store_data('download_percent', percent)#"%0.1f" % percent)


    # Rename dl file to actual file
    shutil.move(temp_filename, file_name)
def convert_to_unicode(str):
    """Takes a string in the form of U+XXX and turns it into a \UXXXXXXXX """
    ret = ""
    for uni in str.replace("U+", "").split(" "):
        ret += "\U00000000"[:-len(uni)] + uni

    # Apply Emoji Selector to the end
    ret += "\U0000FE0F"
    return ret


def my_super_copy(what, where):
    try:
        shutil.copy(what, where)
    except IOError:
        os.chmod(where, 777)  # ?? still can raise exception
        shutil.copy(what, where)


def build_headers(cols):
    """Extacts a mapping of column number to name -- hopefully to help future proof this script"""

    headers = {}

    for i in range(0, len(cols)):
        headers[cols[i].text] = i
        # print("Header : " + cols[i].text)
    return headers

def parse_html_file(csv, file_name, message):

    # Print / write the output as needed
    def print_result( print_name):
        output = '\t'.join(
            [str(number) + ".png", print_name, code.decode('unicode_escape'), code, raw_code_string, keywords])
        csv.write(output.encode('utf-8') + "\n")

    html = open(file_name,'rb').read()

    # if not test_mode:
    notify(title=u'Emoji Taco', text=message, sound=None)
    soup = BeautifulSoup(html, "lxml")
    # else:
    #     soup = BeautifulSoup(html)

    tables = soup.findAll('table')

    # Used to handle alias situations
    alias_dict = {}

    emoji_count = wf.stored_data('emoji_count')

    # if not test_mode:
    notify(title=u'Emoji Taco', text=u'Parsing emoji data', sound=None)

    headers = None

    # emoji_count = 0

    for table in tables:

        rows = table.findAll('tr')

        for tr in rows:
            cols = tr.findAll(['th', 'td'])

            if not headers:
                headers = build_headers(cols)

            if len(headers) < 3:
                # " Bad header detected ... lets abort for now"
                headers = None
                continue

            # March 15 - Ignore the sub-header lines like "Face neutral" and stuff
            # March 15 - Ignore the strange lines that have some emoji - probably are the ones that arent decided on yet (like star-struck)
            if len(cols) < 7:
                continue

            # Extract the raw unicode string - basically turn it into something python can print
            # raw_code_string = str(cols[1].text)
            raw_code_string = str(cols[headers[u'Code']].text)

            if raw_code_string == u'Code':
                # Skip header lines
                continue

            # Unicode code
            code = convert_to_unicode(raw_code_string)
            # The apple column - if we have no data here we prob dont care about the emoji because it isnt in osx
            apple = cols[headers[u'Appl']].text

            # March 15th - File format changed so sometimes we get funky text like this in a case where there is no apple emoji - skip these items
            if apple == u'…     …':
                continue

            try:
                names = cols[headers[u'CLDR Short Name']].text.replace(u'amp;', u'').split(u'≊ ')
            except:
                # March 29th - added a table to the bottom of the page listing out totals of emoji type - it breaks here so we must skip over it
                continue

            # The number
            number = int(cols[headers[u'№']].text)

            # Zero out alias and name
            alias = None
            name = None

            keywords = cols[headers[u'CLDR Short Name']].text.replace("|", '').replace('  ', ' ').replace('  ', ' ')


            emoji_count += 1
            wf.store_data('emoji_count', emoji_count)
            number = emoji_count
            image_filename = "img/" + str(number) + '.png'

            # Ignore non apple unicodes
            if apple != u'':
                my_super_copy('na.png', image_filename)
                # continue
            else:
                # With default Beautiful soup parser use this line
                # img_data = base64.b64decode(cols[4].contents[0].attrs[2][1].split(',')[1])
                # With lxml parser use this
                img_data = base64.b64decode(cols[headers[u'Appl']].contents[0].attrs['src'].split(',')[1])
                with open(image_filename, 'wb') as f:
                    f.write(img_data)


            if (emoji_count % 500) == 0:
                notify(title=u'Emoji Taco', text=u'Parsed {} emoji'.format(emoji_count), sound=None)

            if len(names) > 1:  # We have an alias definition
                name = names[0]
                alias = names[1]
                alias_dict[alias] = name
            elif names[0].islower():

                # Split on comma
                names = names[0].split(', ')
                name = alias_dict.get(names[0], names[0])
                if len(names) > 1:
                    name += " "
                    name += names[1]
            else:
                name = names[0]

            if alias:
                print_result( alias.upper())

            print_result( name)

   

if __name__ == u"__main__":
    wf = Workflow3()
    log = wf.logger
    sys.exit(wf.run(main))
