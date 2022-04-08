-- Don't create swap files
vim.opt.swapfile      = false

-- Navigation 
vim.opt.mouse         = "a"
vim.wo.number         = true
vim.wo.relativenumber = true
vim.wo.cursorline     = true

-- Searching: Patterns 
vim.opt.hlsearch      = false
vim.opt.ignorecase    = true

-- Searching: Files
vim.opt.path          = ".,/home/nikin/.config/**,**,/home/nikin/**,/usr/include"
vim.opt.autochdir     = true

-- Indentations
vim.opt.shiftwidth    = 2
vim.opt.tabstop       = 2
vim.opt.softtabstop   = 2
vim.opt.expandtab     = true

-- Line wrapping 
vim.bo.textwidth      = 79
vim.wo.linebreak      = true
vim.wo.wrap           = false

-- Appearance
vim.opt.termguicolors = true
vim.cmd [[ colorscheme ayu ]]
