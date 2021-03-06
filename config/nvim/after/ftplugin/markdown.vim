"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftplugin file
"
" Language: Viwmwiki
" Maintainer: Nikin Baidar <nikinbaidarr@gmai.com>
" Syntax: markdown
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal textwidth=79
setlocal colorcolumn=80
setlocal spell
setlocal complete+=kspell
setlocal spellcapcheck=\_[\])'"   ]\+

" Title case an entire line
command! MakeTitleCase :s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g
" Set the main heading to filename
command! IH execute("call Create_h1()")
command! Date :.! echo "\#\# $(date +'\%a \%b \%d \%Y')"

function! Create_h1()
    :let @a=expand("%:r")
    :normal! gg
    if getline(".") =~ "^\\s*#\ *"
        " Update the heading if filename is changed
        :normal! 2lD"ap
    else
        " generate a heading if no heading exists
        :normal! ggI# "apo
    endif
endfunction
