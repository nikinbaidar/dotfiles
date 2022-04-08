"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftplugin file
"
" Language: MySQL (PopSQL emulation)
" Maintainer: Nikin Baidar <nikinbaidarr@gmai.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CodeRunner()
    :update
    :let @d = 'm5vip rs`5'
    :normal! @d
endfunction
