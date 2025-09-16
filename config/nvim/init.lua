---@diagnostic disable: undefined-global

-- Lua imports from ~/.config/nvim/lua/
require('core.settings')
require('core.maps')

-- Lazy.nvim plugin manager
require('core.lazy')

-- Config lsp and diagnostics
-- Has to be after all lsp servers are installed
require('core.lsp')
