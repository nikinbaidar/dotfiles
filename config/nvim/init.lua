--[[
 _______________________________ 
/ Filename   : init.lua         \
| Maintainer : nikinbaidar      |
| Loaction   : ~/.config/nvim/  |
\ Description: Configs for nvim /
 -------------------------------
                      \   ^__^
                       \  (oo)\_______
                          (__)\       )\/\
                              ||----w |
                              ||     ||
--]]

require('packages')
require('config')
require('bindings')
require('abbreviations')

-- Auto-commands
vim.cmd [[ 

" Run :h fo-table for the description about formatoptions.
autocmd Filetype * set fo-=o | set fo+=tq 

" Automatically jump to the last cursor position
autocmd BufReadPost * execute "normal g`\"zz" 

autocmd TermOpen term://* startinsert

]]
