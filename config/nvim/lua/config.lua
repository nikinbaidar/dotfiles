-- Don't create swap files
vim.opt.swapfile       = false

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
      init_selection = "<leader>tn", -- this node
      node_incremental = "<leader>in", -- increase node
      node_decremental = "<leader>dn", -- decrease node
      scope_incremental = "grc"
    }
  } 
}

-- LSP config
local lsp = require('lspconfig')

lsp.pyright.setup {
  autostart = false,
  root_dir = function()
    return vim.fn.getcwd()
  end
}

-- Lua functions
--

function RecordSpellingMistakes()
  vim.api.nvim_command("tabe ~/repos/dots/config/nvim/lua/abbreviations.lua")
  vim.api.nvim_command("normal! GOgt")
  vim.api.nvim_command("silent 0,$ normal! gg]sywgtiabbr pogT1z=")
  vim.api.nvim_command("normal! gt")
end
