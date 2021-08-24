setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab

function! CodeRunner()
    if &modified
        :write
        :silent !$HOME/scripts/reloadLocalUrl.sh
        :redraw!
    endif
endfunction

autocmd BufWritecmd *.html,*.css call CodeRunner()
