"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftplugin file
"
" Language: Tex, LaTeX
" Maintainer: Nikin Baidar <nikinbaidarr@gmai.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal textwidth=79
setlocal colorcolumn=80
setlocal spell
setlocal complete+=kspell
setlocal spellcapcheck=\_[\])'"   ]\+

let b:surround_{char2nr("'")} = "`\r'"
let b:surround_{char2nr("\"")} = "``\r''"

" Quick item-s
imap <C-j> <CR><C-h>\item<Space>

" User-defined Commands
command Main execute("edit ../*.tex")
command Pre  execute("split ~/Notes/Archives/Miscellaneous Files/preamble.tex")

" Auto Commands
autocmd VimLeave *.tex silent ! ${HOME}/.local/bin/removeTexDependencies

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The following section includes the most ironic pieces of code I've ever
" written. This code makes me productive and unproductive at the same time.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>v :call ViewPDF()<CR>

command! AddBibliography execute("call BiblatexCompile()")

function! ViewPDF()
    let g:pdffile = expand("%:r").".pdf"
    if empty(expand(glob(g:pdffile)))
        let g:pdffile = "../*.pdf"
    endif
    execute ("silent ! jumanji") g:pdffile
endfunction

function! BiblatexCompile()
    :! clear ; biber %:r
    silent call CompileSource()
endfunction

" function! CompileSource()
"     :! pdflatex %
" endfunction

" function! CompileParent()
"     :cd ..
"     pdflatex [a-z]*.tex
"     :cd -
" endfunction

function! CodeRunner()
    update
    below split
    resize 15
    term pdflatex %
endfunction
