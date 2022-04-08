"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftplugin file
"
" Language: Python
" Maintainer: Nikin Baidar <nikinbaidarr@gmai.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal colorcolumn=80

function! CodeRunner()
  update
  below split
  resize 15
  term python %
endfunction
