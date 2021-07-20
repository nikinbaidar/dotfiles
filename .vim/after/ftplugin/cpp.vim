function! CodeRunner()
    :write!
    :! g++ % -o ~/code/cpp/runcode && ~/code/cpp/runcode
endfunction
