#! /usr/bin/env python3
import io
import json
import pathlib
import lz4.block

from os import system

fpath = next(iter(pathlib.Path("~/.mozilla/firefox").expanduser().glob(
    "hunb5k7z.default-release/sessionstore-backups/recovery.jsonlz4")))

with io.open(fpath, "rb") as fd:
    fd.read(8)
    jdata = json.loads(lz4.block.decompress(fd.read()).decode("utf-8"))

    for win in jdata.get("windows"):
        for tab in win.get("tabs"):
            i = tab["index"] - 1
            print(tab["entries"][i]["url"])

# for i in range(len(url_list)):
#     if url_list[i].startswith("file:///"):
#         local_files_index = i+1
#         break
#     else:
#         local_files_index = -1


# print (local_files_index)
