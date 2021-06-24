" import vim settings file
source ~/.config/nvim/.vimsettings

" import vim plugins file with its settings and mappings
source ~/.config/nvim/.vimplugins

" import vim mapping file
source ~/.config/nvim/.vimkeymapping

" Vim plugins imports
source ~/.config/nvim/plugins/whichkey.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/floaterm.vim

" Lua imports from ~/.config/nvim/lua/
lua require('tsserver-lsp')
