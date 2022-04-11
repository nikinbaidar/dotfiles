# !/bin/bash
#
#  _               _                 _ _
# | |__   __ _ ___| |__         __ _| (_) __ _ ___  ___  ___
# | '_ \ / _` / __| '_ \ _____ / _` | | |/ _` / __|/ _ \/ __|
# | |_) | (_| \__ \ | | |_____| (_| | | | (_| \__ \  __/\__ \
# |_.__/ \__,_|___/_| |_|      \__,_|_|_|\__,_|___/\___||___/

alias ls="LANG=C ls --color=always --group-directories-first"
alias grep="grep --color=always"
alias less="less --RAW-CONTROL-CHARS"
alias pqiv="pqiv >& /dev/null"
alias octave="octave --silent"
alias R="R --silent"
alias qrencode="xclip -o > confidential && qrencode --type utf8 < confidential && rm ./confidential"
alias wikit="wikit --line 1000"

function weather() {
  curl wttr.in/${1}
}

## Works with .pptx and .docx FIXED DEPRECIATION
alias convert2pdf="soffice --headless --convert-to pdf"

# Function Definitions

function update() {
    function git_commit() {
        if [ $# -eq 3 ]
        then
            git commit -m "${2}"
        else [ $# -eq 1 ]
            git commit -m "added $(basename ${1}) to ${branch}"
        fi
    }

    # main()
    # Variable Declarations
    repo=${!#}
    pushd ${repo}
    branch=$(git branch | awk ' /\*/ {print $2} ')
    git add --all
    git_commit "$@"
    git push -u origin ${branch} --verbose
    popd 
}

function def() {
	sdcv -n --utf8-output --color "$@" 2>&1 | \
	fold --width=$(tput cols) | \
	less --quit-if-one-screen -RX
}
