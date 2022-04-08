"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftplugin file
"
" Language: Nodejs
" Maintainer: Nikin Baidar <nikinbaidarr@gmai.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CodeRunner()
    :update
    :! node %
endfunction
