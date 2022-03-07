-- Globally map <Space> as the leader key.
vim.g.mapleader = " " 

-- Ultisnip Mappings
vim.g.UltiSnipsJumpForwardTrigger  = "<C-l>"
vim.g.UltiSnipsJumpBackwardTrigger = "<C-z>"
vim.g.UltiSnipsExpandTrigger       = "<Tab>"

-- Quickly compile and run codes
vim.api.nvim_set_keymap('n', '<leader>r', 
':call CodeRunner()<CR>', {noremap = true})

-- Splits
-- Normally I have, at most two splits open so just mapping j and k works for
-- me. Also this work flow overlaps with my dwm workflow so yay.
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>w'         , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>w'         , {noremap = true}) 

-- Buffers 
vim.api.nvim_set_keymap('n', '<leader>d', ':bdelete<CR>'   , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>s', ':ls<CR>:buffer' , {noremap = true})

-- Use system clilpboard
vim.api.nvim_set_keymap('' , '<C-y>'    , '"+y'            , {noremap = true})
vim.api.nvim_set_keymap('' , '<C-q>'    , '"+d'            , {noremap = true})
vim.api.nvim_set_keymap('' , '<C-p>'    , '"+p'            , {noremap = true})

-- Don't remove fingers from HOME row in command mode
vim.api.nvim_set_keymap('c', '<C-p>'    , '<Up>'           , {noremap = true})
vim.api.nvim_set_keymap('c', '<C-n>'    , '<Down>'         , {noremap = true})

--[[

-- Cancel auto-completions with <C-q> instead of <C-e>
vim.api.nvim_set_keymap('i', '<C-q>',
        'pumvisible()?"<C-e>":"<C-q>"', {expr = true, noremap = true})

vim.api.nvim_set_keymap('!', '<C-d>'    , '<Del>'         , {noremap = true})
vim.api.nvim_set_keymap('!', '<C-e>'    , '<End>'         , {noremap = true})
vim.api.nvim_set_keymap('!', '<C-a>'    , '<Home>'        , {noremap = true})
vim.api.nvim_set_keymap('!', '<C-k>'    , '<C-o>D'        , {noremap = true})
vim.api.nvim_set_keymap('!', '<C-f>'    , '<Right>'       , {noremap = true})
vim.api.nvim_set_keymap('!', '<C-b>'    , '<Left>'        , {noremap = true})

--]]
