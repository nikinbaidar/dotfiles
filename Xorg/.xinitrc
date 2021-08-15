
unclutter -grab &

setxkbmap -option caps:swapescape &

xset -dpms && xset s off &

/usr/bin/dropbox &

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec i3

