#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import json
import time

start_time = time.time()

def get_elapsed_time():
    elapsed_time = time.time() - start_time
    return  {   
                'full_text' : '%s' % str(time.strftime("%H:%M", time.gmtime(elapsed_time))),
                'name' : 'elapsed_time',
                "color": "#aaff00" if elapsed_time < (60 * 25) else "#ff0000"
            }

def get_motd():
    return {'full_text': "It could be worse. I could be sting",'name' : 'motd'}


def print_line(message):
    """ Non-buffered printing to stdout. """
    sys.stdout.write(message + '\n')
    sys.stdout.flush()

def read_line():
    """ Interrupted respecting reader for stdin. """
    # try reading a line, removing any extra whitespace
    try:
        line = sys.stdin.readline().strip()
        # i3status sends EOF
        if not line:
            sys.exit(3)
        return line
    # exit on ctrl-c
    except KeyboardInterrupt:
        sys.exit()

if __name__ == '__main__':
    # Skip the first line which contains the version header.
    print_line(read_line())

    # The second line contains the start of the infinite array.
    print_line(read_line())

    while True:
        line, prefix = read_line(), ''
        # ignore comma at start of lines
        if line.startswith(','):
            line, prefix = line[1:], ','

        j = json.loads(line)
        # insert information into the start of the json, but could be anywhere
        j.insert(0, get_elapsed_time())
        j.insert(0, get_motd())
        # and echo back new encoded json
        print_line(prefix+json.dumps(j))
