#! /bin/bash

answer=$(echo -e "1\n2" | rofi -dmenu -i -p \
    "How many displays do you want?")

if [ $answer = 1 ]; then
    /home/nikin/.config/screenlayout/my_single_monitor_setup.sh
elif [ $answer = 2 ]; then
    /home/nikin/.config/screenlayout/my_dual_monitor_setup.sh
elif [ $answer -gt 2 ] ; then
    zenity --width=250 --error --text="Config for ${answer} monitors not found!"
fi
