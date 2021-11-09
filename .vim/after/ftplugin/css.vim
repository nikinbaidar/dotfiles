setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab

function! Reload()
    if &modified
        write
        silent !/home/nikin/Scripts/reloadLocalFile
        redraw!
    endif
endfunction

autocmd BufWritecmd *.css call Reload()
