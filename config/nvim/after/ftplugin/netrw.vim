setlocal bufhidden=delete
setlocal colorcolumn=
let g:netrw_list_hide='.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'
let g:netrw_banner = 0 " Suppress netrw banner
let g:netrw_bufsettings = 'number nowrap noma nomod nobl ro'
let g:netrw_dirhistmax = 0 " Don't save netrw history or bookmarks
