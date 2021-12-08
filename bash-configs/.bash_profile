# bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

# automatically start startx and supress startx output on login
[[ -z $DISPLAY && XDG_VTNR -eq 1 ]] && exec startx &> /dev/null
