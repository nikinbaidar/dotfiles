"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftplugin file
"
" Language: C++
" Maintainer: Nikin Baidar <nikinbaidarr@gmai.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CodeRunner()
    :update
    :! g++ % -o ~/Documents/Common-Projects/cpp/runcode && ~/Documents/Common-Projects/cpp/runcode
endfunction
