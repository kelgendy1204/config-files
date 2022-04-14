" import vim settings file
source ~/.config/nvim/vimsettings.vim

" import vim plugins file with its settings and mappings
source ~/.config/nvim/vimplugins.vim

" import vim mapping file
source ~/.config/nvim/vimkeymapping.vim

" Vim plugins imports
source ~/.config/nvim/plugins/whichkey.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/nvim-tree.vim
source ~/.config/nvim/plugins/blankline-indent.vim

" Lua imports from ~/.config/nvim/lua/
lua require('_lsp-tsserver')
lua require('_lsp-eslint')
lua require('_lsp-signature')
lua require('_treesitter')
lua require('_formatter')
lua require('_gitsigns')
lua require('_kommentary')
lua require('_barbar')
lua require('_nvim-tree')
lua require('_lualine')
lua require('_nvim-cmp')
lua require('_telescope')
