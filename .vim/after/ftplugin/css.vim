setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab

function! CodeRunner()
    write
    silent !bash $HOME/scripts/reloadFirefox.sh
    write
endfunction

" autocmd BufWriteCmd *.html,*.css call CodeRunner()
