"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftplugin file
"
" Language: Tex, LaTeX
" Maintainer: Nikin Baidar <nikinbaidarr@gmai.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal textwidth=70
setlocal colorcolumn=71
setlocal spell
setlocal complete+=kspell
setlocal spellcapcheck=\_[\])'"   ]\+

let b:surround_{char2nr("'")} = "`\r'"
let b:surround_{char2nr("\"")} = "``\r''"

" Quick item-s
imap <C-j> <CR><C-h>it<Tab>

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

" command! AddBibliography execute("call BiblatexCompile()")

function! ViewPDF()
    let g:pdffile = expand("%:r").".pdf"
    if empty(expand(glob(g:pdffile)))
        let g:pdffile = "../*.pdf"
    endif
    execute ("silent ! zathura --fork") g:pdffile
endfunction

" function! BiblatexCompile()
"     :! clear ; biber %:r
"     silent call CompileSource()
" endfunction

function! CompileSource()
    :silent! execute("! clear && pdflatex %")
endfunction

function! CompileParent()
    :cd ..
    :silent! execute ("! clear &&  pdflatex [a-z]*.tex")
    :cd -
endfunction

function! CodeRunner()
    write!
    let g:is_Source = system("${HOME}/.local/bin/sourceTexCheck")
    if g:is_Source
        call CompileSource()
    else
        call CompileParent()
    endif
    redraw!
endfunction
