# !/bin/bash
#
#  _               _                 _ _
# | |__   __ _ ___| |__         __ _| (_) __ _ ___  ___  ___
# | '_ \ / _` / __| '_ \ _____ / _` | | |/ _` / __|/ _ \/ __|
# | |_) | (_| \__ \ | | |_____| (_| | | | (_| \__ \  __/\__ \
# |_.__/ \__,_|___/_| |_|      \__,_|_|_|\__,_|___/\___||___/

alias grep="grep --color=always"
alias pqiv="pqiv >& /dev/null"

## Works with .pptx and .docx FIXED DEPRECIATION
alias convert2pdf="soffice --headless --convert-to pdf"

# Function Definitions

function update() {

    if [ $# -eq 2 ] ; then
        cd ${2}
        git add --all
        git commit -m "synchronize ${2}"
    else
        cd $3
        git add --all
        git commit
    fi

    git push -u origin ${1}
    cd -
}


function def() {
	sdcv -n --utf8-output --color "$@" 2>&1 | \
	fold --width=$(tput cols) | \
	less --quit-if-one-screen -RX
}
