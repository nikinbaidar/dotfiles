setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab

function! CodeRunner()
    if &modified
        write
        silent !bash $HOME/scripts/reloadFirefox.sh
    endif
endfunction

autocmd BufWriteCmd *.html,*.css call CodeRunner()
