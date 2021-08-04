setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab

function! CodeRunner()
    :silent !bash ~/scripts/reloadFirefox.sh
    :silent !bash ~/scripts/reloadFirefox.sh
endfunction

autocmd BufWritePre *.html,*.css call CodeRunner()
