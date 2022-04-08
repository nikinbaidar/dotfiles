"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftplugin file
"
" Language: CSS
" Maintainer: Nikin Baidar <nikinbaidarr@gmai.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CodeRunner()
    update
    execute ("silent ! ${HOME}/.local/bin/reloadLocalFile")
endfunction

" autocmd BufWritecmd *.css call CodeRunner()
