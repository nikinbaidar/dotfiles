
reload="F5"

visual_browser_window="$(xdotool search --all --onlyvisible --name firefox)"

for focusedTab in $visual_browser_window; do
        xdotool key --window "$focusedTab" $reload
done
