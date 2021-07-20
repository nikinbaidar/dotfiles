function! CodeRunner()
    :write!
    :! gcc % -o ~/code/c/runcode && ~/code/c/runcode
endfunction
