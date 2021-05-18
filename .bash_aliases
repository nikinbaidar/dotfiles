# !/bin/sh

#  _               _                 _ _
# | |__   __ _ ___| |__         __ _| (_) __ _ ___  ___  ___
# | '_ \ / _` / __| '_ \ _____ / _` | | |/ _` / __|/ _ \/ __|
# | |_) | (_| \__ \ | | |_____| (_| | | | (_| \__ \  __/\__ \
# |_.__/ \__,_|___/_| |_|      \__,_|_|_|\__,_|___/\___||___/

# enable color support for ls and grep

alias ls="ls --color=auto"

alias grep="grep --color=auto"

# edit config files and reload them expicitly

alias i3config="vim ~/.config/i3/config && i3-msg reload > /dev/null"
alias bashconfig="vim ~/.bashrc && source ~/.bashrc"
alias aliasconfig="vim ~/.bash_aliases && source ~/.bashrc"

# functional aliases

alias lock="i3lock --no-unlock-indicator \
    --image=/home/nikin/Pictures/Wallpapers/arch-linux-wallpaper.png"

alias zathura="zathura --fork 2> /dev/null"

alias nevernote="vim ~/Notes/.index.wiki && /usr/bin/clear -x && rfiles"

alias rfiles="cd ~/Notes && rm -f texput.log */[a-z]*.aux */[a-z]*.log \
    */[a-z]*.out */[a-z]*.toc */[a-z]*.maf */[a-z]*.mtc* */[a-z]*.nav \
    */[a-z]*.snm */*/[a-z]*.aux */*/[a-z]*.log */*/[a-z]*.out \
    */*/[a-z]*.toc */*/[a-z]*.nav */*/[a-z]*.snm */[a-z]*.maf\
    */*/[a-z]*.mtc* ; rm -rf */_minted* && cd - >/dev/null"

alias zeronote="vim ~/note/.index.md"

alias syncnotes="cd ~/Notes && git add --all && git commit -m \"Synchronize\" \
  		 && git push -u origin master && cd -"

alias updatenikinbaidarr="cd ~/website && git add --all \
    && git commit -m \"Synchronize\" && git push -u origin master && cd -"

alias clear="echo Press control L | boxes -d nuke"

alias shutdown="shutdown now"

alias delayshutdown="/usr/bin/shutdown"

# code repo shortcuts

alias ino="cd ~/sketchbook      && vim . && cd - > /dev/null"
alias  js="cd ~/Code/javascript && vim . && cd - > /dev/null"
alias  py="cd ~/Code/python     && vim . && cd - > /dev/null"
alias   c="cd ~/Code/c          && vim . && cd - > /dev/null"
alias cpp="cd ~/Code/cpp        && vim . && cd - > /dev/null"
alias  wd="cd ~/Code/web-design && vim . && cd - > /dev/null"

# temporary aliases

