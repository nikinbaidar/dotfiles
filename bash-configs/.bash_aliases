# !/bin/sh

#  _               _                 _ _
# | |__   __ _ ___| |__         __ _| (_) __ _ ___  ___  ___
# | '_ \ / _` / __| '_ \ _____ / _` | | |/ _` / __|/ _ \/ __|
# | |_) | (_| \__ \ | | |_____| (_| | | | (_| \__ \  __/\__ \
# |_.__/ \__,_|___/_| |_|      \__,_|_|_|\__,_|___/\___||___/

# enable color support for ls and grep

alias ls="ls --color=auto"
alias grep="grep --color=auto"

# augmented sys commands

alias datetime="date -d now"

# edit config files and reload them expicitly

alias i3config="vim ~/.config/i3/config && i3-msg reload > /dev/null"
alias vimconfig="vim ~/.vim/vimrc"
alias bashconfig="vim ~/.bashrc && source ~/.bashrc"
alias aliasconfig="vim ~/.bash_aliases && source ~/.bashrc"

# functional aliases

alias zathura="zathura --fork 2> /dev/null"
alias pqiv="pqiv 2> /dev/null"

alias notes="ranger ~/notes && /usr/bin/clear -x"

alias webdev="bash ~/scripts/webdevpack.sh 2> /dev/null"

alias syncnotes="cd ~/notes && git add --all && git commit -m \"Synchronize\" \
  		 && git push -u origin master && cd -"

alias updatemysite="cd ~/website && git add --all \
    && git commit -m \"Synchronize\" && git push -u origin master && cd -"

alias clear="echo Press control L | boxes -d nuke"

## Works with .pptx and .docx FIXED DEPRECIATION
alias convert2pdf="soffice --headless --convert-to pdf"

alias swap="setxkbmap -option caps:swapescape && fg 2> /dev/null"

# alias lockscreen="i3-msg fullscreen && tty-clock -f %a\ %b\ %d\ %Y -cnstC7 -d0"

alias clock="i3-msg fullscreen > /dev/null && tty-clock -ctDC7 -d0 \
    && i3-msg fullscreen > /dev/null"

# temporary aliases

alias showlinks="vim ~/Dropbox/links.md && exit"

alias pushproposal="cd ~/notes/Projects/final\ year\ project/ && \
    git add --all && git commit -m \"proposal draft \" \
    && git push -u origin master"
