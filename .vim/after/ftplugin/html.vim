setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab

runtime macros/matchit.vim

function! Reload()
    if &modified
        write!
        execute ("silent ! echo %:p > /home/nikin/Scripts/.localFilename")
        execute ("silent ! /home/nikin/Scripts/reloadLocalFile")
    endif
endfunction

let @p = 'ysiptp}kkJx  '

autocmd BufWritecmd *.html call Reload()
