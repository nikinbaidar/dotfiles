
setlocal spell
setlocal complete+=kspell
setlocal spellcapcheck=\_[\])'"   ]\+

let b:surround_{char2nr("'")} = "`\r'"
let b:surround_{char2nr("\"")} = "``\r''"
syntax enable

function! BiblatexCompile()
    :! clear ; biber %:r
    silent call CodeRunner()
endfunction

command! AddBibliography execute("call BiblatexCompile()")

function! OpenPDF()
    let g:pdffile = expand("%:r").".pdf"
    execute ("silent ! zathura --fork") g:pdffile
endfunction

function! CodeRunner()
    :write!
    :! clear && pdflatex -shell-escape %
endfunction
