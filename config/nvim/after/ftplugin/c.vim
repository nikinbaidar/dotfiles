"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftplugin file
"
" Language: C
" Maintainer: Nikin Baidar <nikinbaidarr@gmai.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal cc=80

function! CodeRunner()
  update
  below split
  resize 10
  terminal gcc % -o /tmp/runcode && /tmp/runcode
endfunction
