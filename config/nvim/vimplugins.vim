" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Indent lines
Plug 'lukas-reineke/indent-blankline.nvim'

" Themes
Plug 'morhetz/gruvbox'
" Plug 'kristijanhusak/vim-hybrid-material'
" Plug 'altercation/vim-colors-solarized'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'ayu-theme/ayu-vim'
" Plug 'mhartington/oceanic-next'
" Plug 'rakr/vim-one'
" Plug 'joshdick/onedark.vim'
" Plug 'tomasiser/vim-code-dark'

" Bottom bar theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File explorer
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" For comments
Plug 'scrooloose/nerdcommenter'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Surround code with anything
Plug 'tpope/vim-surround'

" For git signs and its dependencies
" Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" For project global search
" Need more installations
" TODO look for alternatives
Plug 'mileszs/ack.vim'

" For git integration
Plug 'tpope/vim-fugitive'

" Fuzzy search for color schemes
Plug 'flazz/vim-colorschemes'

" For multicursors
Plug 'terryma/vim-multiple-cursors'

" Vim script for text filtering and alignment
" Plug 'godlygeek/tabular'

" Setup lsp
" Setup the requested lsp servers
Plug 'neovim/nvim-lspconfig'

" Lsp Completion
Plug 'hrsh7th/nvim-compe'
" Support signature for nvim-compe until it's implemented
Plug 'ray-x/lsp_signature.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" For buffers handling, extracting them to tabs, name the tabs and moving them
Plug 'vim-ctrlspace/vim-ctrlspace'

" formatter plugin
Plug 'mhartington/formatter.nvim'

" Tabbar plugin
" Need more installations
" Plug 'majutsushi/tagbar'

" auto closing tags
Plug 'alvan/vim-closetag'

" better searching
" Need more installations
" TODO study more
Plug 'mhinz/vim-grepper'

" Window swapping
Plug 'wesQ3/vim-windowswap'

" gitk for vim
Plug 'cohama/agit.vim'

" git commits history for lines
Plug 'rhysd/git-messenger.vim'

" Make terminal vim and tmux work better together for focusing events
Plug 'tmux-plugins/vim-tmux-focus-events'

" Save session workspace
Plug 'tpope/vim-obsession'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" A plugin to color colornames and codes
Plug 'chrisbra/Colorizer'

" Editor config plugin
Plug 'editorconfig/editorconfig-vim'

" Float terminal
Plug 'voldikss/vim-floaterm'

" Which key for list key mapping with leader key
Plug 'liuchengxu/vim-which-key'

" Pair brackets
Plug 'jiangmiao/auto-pairs'

" Initialize plugin system
call plug#end()

" ===================================================================== "
" Plugin settings
" ===================================================================== "

" ===== Airline config
let g:airline_powerline_fonts            = 1
let g:airline#extensions#tabline#enabled = 1

" enable/disable nvimlsp integration
let g:airline#extensions#nvimlsp#enabled = 1
" nvimlsp error_symbol
let airline#extensions#nvimlsp#error_symbol = 'E:'
" nvimlsp warning
let airline#extensions#nvimlsp#warning_symbol = 'W:'
let g:airline_exclude_preview = 1

" ===== Ctrl-space setup
if has("gui_running")
    " Settings for MacVim and Inconsolata font
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
else
    echo "silversearcher-ag package (ag command) is Required"
endif

let g:CtrlSpaceSearchTiming = 500
let g:CtrlSpaceUseTabline = 1

" ===== Vim javascript configuration
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" ===== Vim close tag
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,js'
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" ===== Tmux navigator
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" ===== yats plugin
" highlight host specific keywords for typescript
let g:yats_host_keyword = 1

" ===================== Git Messenger Plugin ===================== "

let g:git_messenger_close_on_cursor_moved = v:false
let g:git_messenger_always_into_popup = v:true

" ===== gruvbox theme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark
colorscheme gruvbox
let g:gruvbox_bold             = 1
let g:gruvbox_italic           = 1
let g:gruvbox_contrast_dark    = 'medium'
let g:gruvbox_contrast_light   = 'medium'
let g:gruvbox_invert_selection = '0'
let g:airline_theme            = 'gruvbox'

" ===== CtrlSpace
" CtrlSpace plugin fix for neovim
let g:CtrlSpaceDefaultMappingKey = "<C-space> "