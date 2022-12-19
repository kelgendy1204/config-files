-- Lua imports from ~/.config/nvim/lua/
require('_packer')
require('_lsp-tsserver')
require('_lsp-efm')
require('_lsp-signature')
require('_formatter')
require('_gitsigns')
require('_kommentary')
require('_barbar')
require('_nvim-tree')
require('_lualine')
require('_nvim-cmp')
require('_treesitter')
require('_which-key')
require('_telescope')

-- Import vim settings file
vim.api.nvim_command('source ~/.config/nvim/vimsettings.vim')

-- Import vim plugins file with its settings and mappings
vim.api.nvim_command('source ~/.config/nvim/vimplugins.vim')

-- Import vim mapping file
vim.api.nvim_command('source ~/.config/nvim/vimkeymapping.vim')

-- Vim plugins imports
vim.api.nvim_command('source ~/.config/nvim/plugins/floaterm.vim')
vim.api.nvim_command('source ~/.config/nvim/plugins/nvim-tree.vim')
vim.api.nvim_command('source ~/.config/nvim/plugins/blankline-indent.vim')
