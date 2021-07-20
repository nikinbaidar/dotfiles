syntax enable
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=70 " FIXME??
setlocal cursorcolumn
setlocal spell
setlocal complete+=kspell
setlocal spellcapcheck=\_[\])'"   ]\+

" Explicitly Reload tex Files
if (getcwd() =~ '/home/nikin/notes/*/*/*')
    let g=expand('%<:p')
    let b=char2nr(g[0])
    if (b >= 97 && b < 123)
        set filetype=tex
        syntax enable
        setlocal textwidth=70 " FIXME??
    endif
endif

function! CompileParent()
    :write!
    :cd ..
    :execute (" ! clear && pdflatex [a-z]*.tex")
    :cd -
endfunction

nnoremap <F2> :call CompileParent()<CR><CR><CR>

function! OpenLatexSourceCode()
    if (getcwd() =~ '/home/nikin/notes/*' && expand('%') == ".chapters.md")
        execute ("tabnew *.tex")
    elseif (getcwd() =~ '/home/nikin/notes/*')
        execute ("tabnew ../*.tex")
    endif
endfunction

" Sosukodo is japanese for source code
command! Sosukodo execute("call OpenLatexSourceCode()")

function! OpenPDF()
    if (getcwd() =~ '/home/nikin/notes/*' && expand('%') == ".chapters.md")
        let g:pdffile = "*.pdf"
    elseif (getcwd() =~ '/home/nikin/notes/*')
        let g:pdffile = "../*.pdf"
    endif
    execute ("silent ! zathura --fork") g:pdffile
endfunction

" Because Hex tends to break syntax
command! Hex execute ("split" ) | edit .
