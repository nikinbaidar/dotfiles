#! /bin/bash

answer=$(echo -e "yes\nno" | rofi -dmenu -i -p \
    "Are you sure you want to sign off?")

if [ $answer = yes ]
then
    pkill -u $USER
fi
