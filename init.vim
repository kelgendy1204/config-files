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

" ===== PaperColor theme
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set termguicolors
" set background=dark
" colorscheme PaperColor
" let g:airline_theme = 'papercolor'

" ===== gruvbox theme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark
colorscheme gruvbox
let g:gruvbox_bold           = 1
let g:gruvbox_italic         = 1
let g:gruvbox_contrast_dark  = 'medium'
let g:gruvbox_contrast_light = 'medium'
let g:airline_theme          = 'gruvbox'

" ===== OceanicNext theme
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" if (has("termguicolors"))
    " set termguicolors
" endif
" syntax enable
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext
" let g:airline_theme='oceanicnext'

" ===== One theme

" if (empty($TMUX))
    " if (has("nvim"))
        " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    " endif
    " if (has("termguicolors"))
        " set termguicolors
    " endif
" endif

" set background=dark
" let g:airline_theme='one'
" let g:one_allow_italics = 1
" colorscheme one
