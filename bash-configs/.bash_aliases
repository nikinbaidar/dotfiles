# !/bin/sh

#  _               _                 _ _
# | |__   __ _ ___| |__         __ _| (_) __ _ ___  ___  ___
# | '_ \ / _` / __| '_ \ _____ / _` | | |/ _` / __|/ _ \/ __|
# | |_) | (_| \__ \ | | |_____| (_| | | | (_| \__ \  __/\__ \
# |_.__/ \__,_|___/_| |_|      \__,_|_|_|\__,_|___/\___||___/

# enable color support for ls and grep

alias ls="ls --color=always"
alias grep="grep --color=always"

# edit config files and reload them explicitly

alias vimconfig="vim ~/.vim/vimrc"
alias bashconfig="vim ~/.bashrc && source ~/.bashrc"
alias aliasconfig="vim ~/.bash_aliases && source ~/.bashrc"

# functional aliases

alias pqiv="pqiv 2> /dev/null"

alias syncnotes="cd ~/Notes && git add --all && git commit -m \"Borrowed from \
the SMARTEST KID in class; Double checked by an AWARD-WINNING TEACHER\" \
&& git push -u origin master && cd -"

alias updatemysite="cd ~/website && git add --all \
    && git commit -m \"Synchronize\" && git push -u origin master && cd -"

# alias clear="echo Press control L | boxes -d nuke"

## Works with .pptx and .docx FIXED DEPRECIATION
alias convert2pdf="soffice --headless --convert-to pdf"
