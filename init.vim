" import vim mapping file
source ~/.vimkeymapping

" import vim settings file
source ~/.vimsettings

" import vim plugins file with its settings and mappings
source ~/.vimplugins

" ====================================================== "
" Neovim settings
" ====================================================== "

" Set true colors for specific terminals
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Return cursor to its default style
set guicursor=

" ====================================================== "
" Neovim Keymapping
" ====================================================== "

" ====================================================== "
" Neovim Plugins settings
" ====================================================== "

" CtrlSpace plugin fix for neovim
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

" ====================================================== "
" Neovim themes
" ====================================================== "

" PaperColor theme
" set background=dark
" colorscheme PaperColor
" let g:airline_theme = 'papercolor'

" gruvbox theme
" set termguicolors
" set background=dark
" colorscheme gruvbox
" let g:gruvbox_bold           = 1
" let g:gruvbox_italic         = 1
" let g:gruvbox_contrast_dark  = 'medium'
" let g:gruvbox_contrast_light = 'medium'
" let g:airline_theme          = 'gruvbox'

" Ayu Theme
set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
colorscheme ayu
