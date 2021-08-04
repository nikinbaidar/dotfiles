
#! /bin/bash

currentWorkspace=$(i3-msg -t get_workspaces | \
    jq '.[] | select(.focused==true).name' | cut -d "\"" -f2)

echo $currentWorkspace

if [ $currentWorkspace = 0: ]
then
    echo "Yes"
else
    echo "No"
fi


