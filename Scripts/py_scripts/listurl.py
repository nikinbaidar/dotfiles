#! /usr/bin/env python
# List all the tabs open in the current firefox session.

'''
* This script uses a secondary file located in the path
  ~/.mozilla/firefox/*.default*/sessionstore-backups/recovery.jsonlz4.

* The recovery.jsonlz4 is a lz4 compressed file that holds information about the
  browser's current session (URLs of all the open tabs along with other
  information). This file exists only when firefox is up and running.

* By default, this file is updated as often as every 15000 ms. This interval is
  controlled by the browser.sessionstore.interval preference.
'''

import json
import lz4.block
import pathlib
import sys

path = pathlib.Path.home().joinpath('.mozilla/firefox')
files = path.glob('*.default*/sessionstore-backups/recovery.jsonlz4')

for f in files:
    b = f.read_bytes()
    if b[:8] == b'mozLz40\0':
        b = lz4.block.decompress(b[8:])
    j = json.loads(b)
    for window in j['windows']:
        url_list = [ tab['entries'][tab['index'] - 1]['url'] \
                for tab in window['tabs'] ]
