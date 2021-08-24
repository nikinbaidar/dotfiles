
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

autocmd VimLeave *.tex !bash ~/scripts/removeTexDependencies.sh

function! CodeRunner()
    :write!
    let g:isSource = system("/home/nikin/scripts/sourceTexCheck.sh")
    if g:isSource
        " Compile Source
        :silent! execute("! clear && pdflatex %")
    else
        " Compile Parent
        :cd ..
        :silent! execute ("! clear &&  pdflatex [a-z]*.tex")
        :cd -
    endif
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

" autocmd BufWriteCmd *.tex if &modified | call CodeRunner() | redraw! | endif
autocmd BufWriteCmd *.tex call CodeRunner() | redraw!
