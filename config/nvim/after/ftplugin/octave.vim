"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftplugin file
"
" Language: Octave
" Maintainer: Nikin Baidar <nikinbaidarr@gmai.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal filetype="matlab"

function! CodeRunner()
    :update
    :! octave %
endfunction
