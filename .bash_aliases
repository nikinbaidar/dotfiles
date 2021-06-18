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

alias zathura="zathura --fork 2> /dev/null"

alias rfiles="cd ~/notes && rm -f texput.log */[a-z]*.aux */[a-z]*.log \
    */[a-z]*.out */[a-z]*.toc */[a-z]*.maf */[a-z]*.mtc* */[a-z]*.nav \
    */[a-z]*.snm */*/[a-z]*.aux */*/[a-z]*.log */*/[a-z]*.out \
    */*/[a-z]*.toc */*/[a-z]*.nav */*/[a-z]*.snm */[a-z]*.maf\
    */*/[a-z]*.mtc* ; rm -rf */_minted* && cd - >/dev/null"

alias zeronote="vim ~/notes/.index.md && /usr/bin/clear -x && rfiles"

alias syncnotes="cd ~/notes && git add --all && git commit -m \"Synchronize\" \
  		 && git push -u origin master && cd -"

alias updatemysite="cd ~/website && git add --all \
    && git commit -m \"Synchronize\" && git push -u origin master && cd -"

alias clear="echo Press control L | boxes -d nuke"

## Works with .pptx and .docx FIXED DEPRECIATION
alias convert2pdf="soffice --headless --convert-to pdf"

alias swap="setxkbmap -option caps:swapescape"

alias showlinks="vim ~/Dropbox/links.md && exit"

# temporary aliases
