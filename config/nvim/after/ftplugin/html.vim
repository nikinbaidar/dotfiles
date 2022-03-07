"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftplugin file
"
" Language: HTML
" Maintainer: Nikin Baidar <nikinbaidarr@gmai.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal spell

function! CodeRunner()
    if &modified
        write!
        execute ("silent ! echo %:p > /tmp/localFilename")
        execute ("silent ! ~/.local/bin/reloadLocalFile")
    endif
endfunction

runtime macros/matchit.vim

autocmd BufWritecmd *.html call CodeRunner()
nnoremap <leader>v :call ViewHTML()<CR>

function! ViewHTML()
    :execute ("silent ! firefox % &")
    :redraw!
endfunction
