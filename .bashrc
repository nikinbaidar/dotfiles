#! /bin/bash

#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|


# If not running interactively, don't do anything

[[ $- != *i* ]] && return

PS1='\[\033[01;31m\]\u\[\033[00m\]@\h:\w\$ '

# Setting environment variables

export EDITOR=vim
export PATH=$PATH:/opt/afni

# Aliash definitions
# Instead of adding all of you aliases here directly,
# Put all your aliases into a separate file like ~/.bash_aliases

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
