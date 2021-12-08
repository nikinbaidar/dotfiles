#! /bin/bash
#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|


PS1='\[\e[01;31m\][\[\e[01;33m\]\u\[\e[01;34m\]@\[\e[01;36m\]\h\[\e[01;30m\]:\[\e[01;35m\]\w\[\e[01;31m\]]\[\e[01;32m\]$\[\e[00;37m\] '

# Setting environment variables

export EDITOR=vim
export PATH=$PATH:${HOME}/.local/bin:/opt/afni

shopt -s checkjobs

# Aliash definitions
# Instead of adding all of you aliases here directly,
# Put all your aliases into a separate file named ~/.bash_aliases

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

function def() {
	sdcv -n --utf8-output --color "$@" 2>&1 | \
	fold --width=$(tput cols) | \
	less --quit-if-one-screen -RX
}
