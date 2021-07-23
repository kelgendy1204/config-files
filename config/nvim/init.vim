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
source ~/.config/nvim/plugins/compe.vim
source ~/.config/nvim/plugins/nvim-tree.vim
source ~/.config/nvim/plugins/blankline-indent.vim

" Lua imports from ~/.config/nvim/lua/
lua require('lsp-tsserver')
lua require('lsp-efm')
lua require('lsp-signature')
lua require('treesitter')
lua require('_formatter')
lua require('_gitsigns')
lua require('_kommentary')
