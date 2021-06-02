#! /bin/bash

# This script changes any file (hidden or not) in the current directory (.)
# that ends with a ".wiki" extension into a file that ends with ".md" extension
# keeeping the basename same.

# TODO make this script run recursively see the man pages for bash

filename="*.wiki"

hiddenFilename=".*.wiki"

if [ -f $filename ]; then
    for file in *.wiki;
    do
        mv "$file" "$(basename "$file" .wiki).md"
    done
fi

if [ -f $hiddenFilename ]; then
    for file in .*.wiki;
    do
        mv "$file" "$(basename "$file" .wiki).md"
    done
fi
