"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftplugin file
"
" Language: CSS
" Maintainer: Nikin Baidar <nikinbaidarr@gmail.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CodeRunner()
  if &modified
    write!
    execute ("silent ! ~/.local/bin/reloadLocalFile")
  endif
endfunction

autocmd BufWritecmd *.css call CodeRunner()
