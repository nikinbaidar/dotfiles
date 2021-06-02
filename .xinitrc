
unclutter -grab &

setxkbmap -option caps:swapescape &

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec i3
