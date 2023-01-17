---@diagnostic disable: undefined-global

-- Lua imports from ~/.config/nvim/lua/
require('_maps')
require('_settings')

-- Import vim settings file
vim.api.nvim_command('source ~/.config/nvim/vimsettings.vim')

-- Import vim mapping file
vim.api.nvim_command('source ~/.config/nvim/vimkeymapping.vim')

require('_packer')
require('_mason')
require('_cmp')
require('_lsp-config')
require('_lsp-efm')
require('_formatter')
require('_gitsigns')
require('_kommentary')
require('_barbar')
require('_nvim-tree')
require('_lualine')
require('_treesitter')
require('_which-key')
require('_telescope')
require('_theme')
require('_indent-blankline')

-- Vim plugins imports
-- Import vim plugins file with its settings and mappings
vim.api.nvim_command('source ~/.config/nvim/vimplugins.vim')
vim.api.nvim_command('source ~/.config/nvim/plugins/floaterm.vim')
vim.api.nvim_command('source ~/.config/nvim/plugins/nvim-tree.vim')
