
# !/bin/sh
# .bash_aliases file
# Syntax:
#
#         alias alias_name="command/s"
#
# Note: Place no space between 'alias_name', '=' and '"command/s"'.

# enable color support for ls and grep

alias ls="ls --color=auto"

alias grep="grep --color=auto"

# edit config files and expicitly reload them

alias i3config="vim ~/.config/i3/config && i3-msg reload > /dev/null"

# functional aliases

alias zathura="zathura --fork  2> /dev/null"

alias nevernote="vim ~/Notes/.index.wiki && /usr/bin/clear -x && rfiles"

alias syncnotes="cd ~/Notes && git add --all && git commit -m \"Synchronize\" \
  		 && git push -u origin master ; cd -"

alias updatenikinbaidarr="cd ~/Web\ Development/nikinbaidarr.github.io \
    && git add --all && git commit -m \"Synchronize\" \
    && git push -u origin master && cd -"

alias rfiles="cd ~/Notes && rm -f texput.log */[a-z]*.aux */[a-z]*.log */[a-z]*.out */[a-z]*.toc */[a-z]*.maf */[a-z]*.mtc* \
    */[a-z]*.nav */[a-z]*.snm */*/[a-z]*.aux */*/[a-z]*.log */*/[a-z]*.out */*/[a-z]*.toc */*/[a-z]*.nav */*/[a-z]*.snm */[a-z]*.maf\
    */*/[a-z]*.mtc* ; rm -rf */_minted* && cd - >/dev/null"

alias clear="echo Use Ctrl-l Instead"

# code repo shortcuts

alias ino="cd ~/sketchbook && vim && cd - > /dev/null"
alias js="cd ~/Code/javascript && vim && cd - >/dev/null"
alias py="cd ~/Code/python && vim && cd - >/dev/null"
alias c="cd ~/Code/c && vim && cd - >/dev/null"
alias cpp="cd ~/Code/cpp && vim && cd - >/dev/null"
alias wd="cd ~/Code/web-design && vim && cd - >/dev/null"

