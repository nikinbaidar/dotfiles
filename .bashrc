#! /bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;31m\]\u\[\033[00m\]@\h:\W\$ '
else
    PS1='\[\033[01;31m\]\u\[\033[00m\]@\h:\W\$ '
fi

# Aliash definitions
# Instead of adding all of you aliases here directly,
# Put all your aliases into a separate file like ~/.bash_aliases

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
