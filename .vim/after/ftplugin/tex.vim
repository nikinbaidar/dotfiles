
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=70 " FIXME??
setlocal spell
setlocal complete+=kspell
setlocal spellcapcheck=\_[\])'"   ]\+

let b:surround_{char2nr("'")} = "`\r'"
let b:surround_{char2nr("\"")} = "``\r''"

nnoremap <F6> :call OpenPDF()<CR>
command! AddBibliography execute("call BiblatexCompile()")
command! Sosukodo execute("tabnew ../*.tex")
command! Iex execute ("split ../.img" )

autocmd VimLeave *.tex silent ! /home/nikin/Scripts/removeTexDependencies

function! CodeRunner()
    let g:is_Source = system("/home/nikin/Scripts/sourceTexCheck")
    if g:is_Source
        call CompileSource()
    else
        call CompileParent()
    endif
endfunction

function! CompileSource()
    :silent! execute("! clear && pdflatex %")
    :redraw!
endfunction

function! CompileParent()
    :cd ..
    :silent! execute ("! clear &&  pdflatex [a-z]*.tex")
    :cd -
    :redraw!
endfunction

function! BiblatexCompile()
    :! clear ; biber %:r
    silent call CompileSource()
endfunction

function! OpenPDF()
    let g:pdffile = expand("%:r").".pdf"
    if empty(expand(glob(g:pdffile)))
        let g:pdffile = "../*.pdf"
    endif
    execute ("silent ! zathura --fork") g:pdffile
endfunction
