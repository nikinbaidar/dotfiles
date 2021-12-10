# !/bin/bash
#
#  _               _                 _ _
# | |__   __ _ ___| |__         __ _| (_) __ _ ___  ___  ___
# | '_ \ / _` / __| '_ \ _____ / _` | | |/ _` / __|/ _ \/ __|
# | |_) | (_| \__ \ | | |_____| (_| | | | (_| \__ \  __/\__ \
# |_.__/ \__,_|___/_| |_|      \__,_|_|_|\__,_|___/\___||___/

alias grep="grep --color=always"

# edit config files and reload them explicitly

alias vimconfig="vim ${HOME}/.vim/vimrc"
alias bashconfig="vim ${HOME}/.bashrc && source ${HOME}/.bashrc"
alias aliasconfig="vim ${HOME}/.bash_aliases && source ${HOME}/.bashrc"

# functional aliases

alias pqiv="pqiv 2> /dev/null"

# alias clear="echo Press control L | boxes -d nuke"

## Works with .pptx and .docx FIXED DEPRECIATION
alias convert2pdf="soffice --headless --convert-to pdf"

# Function Definitions

function syncnotes() {
    cd ${HOME}/Notes
    git add --all
    git commit -m "synchornize notes"
    git push -u origin master
    cd -
}

alias updatemysite="cd ~/website && git add --all \
    && git commit -m \"Synchronize\" && git push -u origin master && cd -"

function update() {
    cd ${2}
    git add --all
    git commit
    git push -u origin ${1}
    cd -
}


function def() {
	sdcv -n --utf8-output --color "$@" 2>&1 | \
	fold --width=$(tput cols) | \
	less --quit-if-one-screen -RX
}
