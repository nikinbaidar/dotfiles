setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab

function! Reload()
    if &modified
        write!
        execute ("silent ! /home/nikin/Scripts/reloadLocalFile")
    endif
endfunction

autocmd BufWritecmd *.html call Reload()
