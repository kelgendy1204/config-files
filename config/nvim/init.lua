---@diagnostic disable: undefined-global

-- Lua imports from ~/.config/nvim/lua/
require('config.maps')
require('config.settings')

-- Import vim settings file
vim.api.nvim_command('source ~/.config/nvim/vimsettings.vim')

-- Import vim mapping file
vim.api.nvim_command('source ~/.config/nvim/vimkeymapping.vim')

-- Vim plugins imports
-- Import vim plugins file with its settings and mappings
vim.api.nvim_command('source ~/.config/nvim/vimplugins.vim')

-- Lazy.nvim plugin manager
require('config.lazy')
