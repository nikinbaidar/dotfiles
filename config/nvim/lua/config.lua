-- Don't create swap files
vim.opt.swapfile       = false

-- Navigation 
vim.opt.mouse          = "a"
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.cursorline     = true

-- Searching: Patterns and Files
vim.opt.incsearch     = false
vim.opt.hlsearch      = false
vim.opt.ignorecase    = true
vim.opt.autochdir     = true
vim.opt.path          = ".,**,/usr/include,,"

-- Line wrapping and indentations
vim.opt.tabstop       = 2
vim.opt.softtabstop   = 2
vim.opt.shiftwidth    = 2
vim.opt.expandtab     = true
vim.opt.textwidth     = 79
vim.opt.colorcolumn   = "80"
vim.opt.linebreak     = true
vim.opt.wrap          = false

-- Colors
vim.opt.termguicolors = true
vim.cmd [[ colorscheme ayu ]]

require 'nvim-treesitter.configs'.setup {
  highlight = { 
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

vim.cmd [[

" Run :h fo-table for the description about formatoptions.
autocmd Filetype * set fo-=r | set fo-=o | set fo-=a | set fo+=tq

" Automatically jump to the last cursor position on entering vim
autocmd BufReadPost * execute "normal g`\"zz" 

]]
