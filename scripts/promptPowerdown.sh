#! /bin/bash

answer=$(echo -e "yes\nno" | rofi -dmenu -i -p \
    "Are you sure you want to power down?")

if [ $answer = yes ]
then
    shutdown now
fi
