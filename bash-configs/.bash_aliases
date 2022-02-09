# !/bin/bash
#
#  _               _                 _ _
# | |__   __ _ ___| |__         __ _| (_) __ _ ___  ___  ___
# | '_ \ / _` / __| '_ \ _____ / _` | | |/ _` / __|/ _ \/ __|
# | |_) | (_| \__ \ | | |_____| (_| | | | (_| \__ \  __/\__ \
# |_.__/ \__,_|___/_| |_|      \__,_|_|_|\__,_|___/\___||___/

alias ls="ls --color=always"
alias grep="grep --color=always"
alias less="less --RAW-CONTROL-CHARS"
alias pqiv="pqiv >& /dev/null"
alias zathura="zathura --fork"
alias octave="octave --silent"
alias R="R --silent"
alias qrencode="qrencode --type utf8"

## Works with .pptx and .docx FIXED DEPRECIATION
alias convert2pdf="soffice --headless --convert-to pdf"

# Function Definitions

function update() {
    # update BRANCH [MESSAGE] REPO

    function git_commit() {
        if [ $# -eq 1 ]; then
            git commit -m "synchronize ${1}"
            # Optimize these options later
        elif [[ $# -eq 2 && "${1}" = "-m" ]]; then
            git commit
        elif [[ $# -eq 2 ]]; then
            git commit -m "${2}"
        fi
    }

    # main()
    # Variable Declarations
    repo=${!#}

    if [ -d ${repo}/.git ]
    then
        pushd ${repo} > /dev/null
        branch=$(git branch | awk ' /\*/ {print $2} ')
        git add --all
        git_commit "$@"
        git push -u origin ${branch} --verbose
        popd > /dev/null
    fi
}

function def() {
	sdcv -n --utf8-output --color "$@" 2>&1 | \
	fold --width=$(tput cols) | \
	less --quit-if-one-screen -RX
}
