-- Globally map <Space> as the leader key.
vim.g.mapleader = " " 

-- Ultisnip Mappings
vim.g.UltiSnipsJumpForwardTrigger  = "<C-f>"
vim.g.UltiSnipsJumpBackwardTrigger = "<C-z>"
vim.g.UltiSnipsExpandTrigger       = "<Tab>"

-- Quickly fix typing errors
vim.api.nvim_set_keymap('i', '<C-l>'    , '<C-[>[s1z=`]a', {noremap = true})

-- Quickly compile and run codes in a split
vim.api.nvim_set_keymap('n', '<F5>', 
	':call CodeRunner()<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>r', 
	':lua RunScript()<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<CR>'     , 'i<CR>'        , {noremap = true})

-- Splits
-- Normally I have, at most two splits open so just mapping j and k works for
-- me. Also this workflow overlaps with my dwm workflow so yay.
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>w'       , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>w'       , {noremap = true}) 
-- Buffers
vim.api.nvim_set_keymap('n', '<leader>s', ':ls<CR>:b'    , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>h', ':bp<CR>'      , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>l', ':bn<CR>'      , {noremap = true}) 

-- Don't remove your fingers from HOME row 
vim.api.nvim_set_keymap('c', '<C-p>'    , '<Up>'         , {noremap = true})
vim.api.nvim_set_keymap('c', '<C-n>'    , '<Down>'       , {noremap = true})
vim.api.nvim_set_keymap('!', '<C-d>'    , '<Del>'        , {noremap = true})

vim.api.nvim_set_keymap('t', '<Esc>'    , '<C-\\><C-n>'  , {noremap = true})
