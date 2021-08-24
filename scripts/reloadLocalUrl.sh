
local_url_outset="file:///"
refresh="F5"

current_window=$(xdotool getactivewindow)

visible_browser_window=$(xdotool search --onlyvisible --name "Mozilla Firefox")

xdotool windowfocus $visible_browser_window && \
    xdotool key "Ctrl+l" "Ctrl+c" "F6"

active_tab_url_outset=$(xclip -o | cut -c 1-8)

if [ $active_tab_url_outset = $local_url_outset ] ; then
    # Reload if the active tab is a local file
    # echo "Local File"
    xdotool key $refresh
# else
    # echo "Remote file"
fi

xdotool windowfocus $current_window
# i3-msg focus right > /dev/null && xdotool key "Ctrl+l" "Ctrl+c" F6
