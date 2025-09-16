---@diagnostic disable: undefined-global

-- Lua imports from ~/.config/nvim/lua/
require('core.maps')
require('core.settings')

-- Vim plugins imports
-- Import vim plugins file with its settings and mappings
vim.api.nvim_command('source ~/.config/nvim/vimplugins.vim')

-- Lazy.nvim plugin manager
require('core.lazy')

-- Config lsp and diagnostics
-- Has to be after all lsp servers are installed
require('core.lsp')
