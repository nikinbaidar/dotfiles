syntax enable
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=70 " FIXME?? NO!
setlocal spell
setlocal complete+=kspell
setlocal spellcapcheck=\_[\])'"   ]\+

command! Iex execute("split ../.img/")
command! IH execute("call Create_h1()")

function! Create_h1()
    :let @a=expand("%:r")
    :normal gg
    if getline(".") =~ "^\\s*#\ *"
        " Update the heading if filename is changed
        :normal 2lD"ap
    else
        " generate a heading if no heading exists
        :normal ggI# "apo
    endif
endfunction
