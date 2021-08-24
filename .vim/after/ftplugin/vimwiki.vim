
syntax enable
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=70 " FIXME??
setlocal spell
setlocal complete+=kspell
setlocal spellcapcheck=\_[\])'"   ]\+

command! Iex execute("split ../.img/")
