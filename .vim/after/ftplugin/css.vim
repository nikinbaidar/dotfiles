setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab

function! Reload()
    :write
    :silent !/home/nikin/Scripts/reloadFocusedTabInFirefox
    :redraw!
endfunction

autocmd BufWritecmd *.css call Reload()
