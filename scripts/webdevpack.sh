
#! /bin/bash

open_main_index () {
    firefox /home/nikin/website/index.html &
    sleep 1
    i3-msg focus left > /dev/null
}

active_window_name=$(i3-msg focus right >/dev/null && \
    xdotool getwindowname $(xdotool getwindowfocus))

# vim -S /home/nikin/website/home.vim
if [[ $active_window_name == *"Mozilla Firefox" ]]; then
    # Firefox is running
    firefox_tabtitle=$(echo $active_window_name | cut -f1 -d' ')
    if [[ ! $firefox_tabtitle == "Notes" ]]; then
        open_main_index
    else
        i3-msg focus left > /dev/null
    fi
else
    open_main_index
fi

vim /home/nikin/website/index.html
