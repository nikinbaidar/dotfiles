#! /bin/bash
#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|

PS1='\[\e[01;31m\][\[\e[01;33m\]\u\[\e[01;34m\]@\[\e[01;36m\]\h\[\e[01;37m\]:'\
' \[\e[01;35m\]\W\[\e[01;31m\]]\[\e[01;32m\]$\[\e[00;37m\] '

export EDITOR=nvim
export LESS="eFRX"
export GOPATH=$HOME/.config/go
export PATH=$PATH:${HOME}/.local/bin:/opt/afni

# Config for lf File Manager
export LF_ICONS="tw=:st=:ow=:dt=:di=:fi=:ln=:or=:ex=:*.c=:*.cc=: \
*.cpp=:*.css=:*.go=:*.h=:*.hh=:*.hpp=:*.html=:*.java=:*.js=:\
*.py=:*.vim=:*.nvim=:*.sql=:*.cmd=:*.sh=: *.*sh=:*.tar=:*.tgz=:\
*.lz4=:*.lzh=:*.zip=:*.gz=:*.tz=:*.deb=:*.rpm=:*.7z=:*.jpg=:\
*.jpeg=:*.gif=:*.bmp=:*.tiff=:*.png=:*.svg=:*.svgz=:*.mpeg=:\
*.webm=:*.MOV=:*.mp4=:*.xcf=:*.mp3=:*.pdf=:*.nix=:*.lua=:"

export LF_COLORS=".git/=01;32:.git=32:.gitignore=32:\
*.mp3=35:ln=01;36:di=01;34:ex=01;32:"

# Shell Options

shopt -s checkjobs

# Aliash definitions
# Instead of adding all of you aliases here directly,
# Put all your aliases into a separate file named ~/.bash_aliases

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
