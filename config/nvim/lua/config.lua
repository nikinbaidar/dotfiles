-- Don't create swap files
vim.bo.swapfile       = false

-- Navigation 
vim.opt.mouse         = "a"
vim.wo.number         = true
vim.wo.relativenumber = true
vim.wo.cursorline     = true

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
vim.bo.textwidth      = 79
vim.wo.colorcolumn    = "80"
vim.wo.linebreak      = true
vim.wo.wrap           = false

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
