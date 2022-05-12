-- Don't create swap files
vim.opt.swapfile      = false

-- Navigation 
vim.opt.mouse          = "a"
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.cursorline     = true

-- Searching: Patterns 
vim.opt.hlsearch      = false
vim.opt.ignorecase    = true
vim.opt.smartcase     = true

-- Searching: Files
vim.opt.path          = "./**,/usr/include,/home/nikin/.config/**,/home/nikin/.local/**,**,/home/nikin/**"
vim.opt.autochdir     = true

-- Indentations
vim.opt.shiftwidth    = 2
vim.opt.tabstop       = 2
vim.opt.softtabstop   = 2
vim.opt.expandtab     = true
vim.opt.breakindent   = true

-- Line wrapping 
vim.opt.textwidth      = 79
vim.opt.linebreak      = true
vim.opt.wrap           = false
vim.opt.sidescroll     = 0

-- Appearance
vim.opt.termguicolors = true
vim.cmd [[ colorscheme spaceduck ]]

-- Treesitter configs
require 'nvim-treesitter.configs'.setup {
  highlight = { enable = true },

  textsubjects = {
    enable = true,
    prev_selection = ',', -- (Optional) keymap to select the previous selection
    keymaps = {
      ['.']  = 'textsubjects-smart',
      [';']  = 'textsubjects-container-outer',
      ['i;'] = 'textsubjects-container-inner',
    },
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection    = "<leader>tn", -- this node
      node_incremental  = "<leader>in",
      node_decremental  = "<leader>dn",
      scope_incremental = "grc"
    }
  } 
}
