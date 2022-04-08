"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftplugin file
"
" Language: Awk, Shell
" Maintainer: Nikin Baidar <nikinbaidarr@gmai.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CodeRunner()
 :update
 :! awk -f % /proc/loadavg
endfunction
