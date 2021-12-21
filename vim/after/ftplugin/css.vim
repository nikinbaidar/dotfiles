"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftplugin file
"
" Language: CSS
" Maintainer: Nikin Baidar <nikinbaidarr@gmai.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CodeRunner()
    if &modified
        write!
        execute ("silent ! ${HOME}/.local/bin/reloadLocalFile")
    endif
endfunction

" autocmd BufWritecmd *.css call CodeRunner()
