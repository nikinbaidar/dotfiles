"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftplugin file
"
" Language: C
" Maintainer: Nikin Baidar <nikinbaidarr@gmai.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CodeRunner()
    write!
    ! gcc % -o ~/Documents/Common-Projects/c/.runcode -lm && ~/Documents/Common-Projects/c/.runcode
endfunction

command! PF execute("%s/print(/printf(")
