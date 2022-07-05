set cc=80

function! CodeRunner()
    update!
    below split
    resize 15
    term bash %
endfunction
