#! /bin/bash

battery_percentage=$(cat /sys/class/power_supply/BAT0/capacity)

battery_status=$(cat /sys/class/power_supply/BAT0/status)

zenity --width=250 --info --text="$battery_status: $battery_percentage%"

if [ $battery_percentage -le 20 ] ; then
    zenity --width=250 --warning --text="LOW BATTERY: Connect Charger!"
fi
