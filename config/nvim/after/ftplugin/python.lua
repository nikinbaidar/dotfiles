-- Vim ftplugin file
-- Language: Python
-- Maintainer: Nikin Baidar <nikinbaidarr@gmai.com>


vim.opt.colorcolumn = "80"

local api = vim.api

function RunScript()
  api.nvim_command('update!')
  api.nvim_command('below split')
  api.nvim_command('term python %')
end
