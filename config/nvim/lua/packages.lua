local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
-- Plug 'mattn/emmet-vim'
-- Plug 'kezhenxu94/vim-mysql-plugin'

-- Nvim Specific Packages
Plug 'nvim-treesitter/nvim-treesitter'

vim.call('plug#end')
