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
imap <C-j> <CR><CR><C-h>\item<Space>

" User-defined Commands
command Main execute("edit ../*.tex")
command Pre  execute("split ~/Notes/Archives/Miscellaneous Files/preamble.tex")
command! MakeTitleCase :s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g

" Auto Commands
autocmd VimLeave *.tex silent ! ${HOME}/.local/bin/removeTexDependencies
" autocmd VimLeave *.tex call CleanUp()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The following section includes the most ironic pieces of code I've ever
" written. This code makes me productive and unproductive at the same time.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>v :call ViewPDF()<CR>

command! AddBibliography execute("call BiblatexCompile()")

function! CleanUp()
  let g:filename = expand('%:r')
  execute ("! ${HOME}/.local/bin/removeTexDependencies") g:filename
  " execute ("echo") g:filename
endfunction

function! ViewPDF()
    let g:pdffile = expand("%:r").".pdf"
    if empty(expand(glob(g:pdffile)))
        let g:pdffile = "../*.pdf"
    endif
    execute ("silent ! jumanji") g:pdffile
endfunction

function! BiblatexCompile()
    :! clear ; biber %:r
    silent call CodeRunner()
endfunction

function! CompileSource()
  if g:headmost[0] =~ "%"
    let g:source_path = getline(1)[2:]
    if ! empty(expand(glob("./" . g:source_path)))
      " Source in current directory
      below split
      resize 15
      execute ("term pdflatex") g:source_path
    elseif ! empty(expand(glob("../" .g:source_path)))
      " Source in previous directory
      below split
      resize 15
      cd .. | execute ("term pdflatex") g:source_path | cd -
    endif
  endif
endfunction

function! CodeRunner()
    update!
    let g:headmost = getline(1)
    if g:headmost[:13] =~ "\documentclass"
      below split
      resize 15
      term pdflatex %
    else
      call CompileSource()
    endif
endfunction
