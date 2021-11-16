" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Indent lines
Plug 'lukas-reineke/indent-blankline.nvim'

" Themes
Plug 'morhetz/gruvbox'

" Bottom and Top bars
Plug 'hoob3rt/lualine.nvim'
Plug 'romgrk/barbar.nvim'

" File explorer
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" For comments
Plug 'b3nj5m1n/kommentary'

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
" TODO check if to be replaced
Plug 'mileszs/ack.vim'

" For git integration
Plug 'tpope/vim-fugitive'

" Fuzzy search for color schemes
Plug 'flazz/vim-colorschemes'

" For multicursors
Plug 'terryma/vim-multiple-cursors'

" Setup lsp
" Setup the requested lsp servers
Plug 'neovim/nvim-lspconfig'

" Lsp Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Do you really need this
Plug 'hrsh7th/cmp-emoji'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Support signature for nvim-compe until it's implemented
Plug 'ray-x/lsp_signature.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" For buffers handling, extracting them to tabs, name the tabs and moving them
Plug 'vim-ctrlspace/vim-ctrlspace'

" formatter plugin
Plug 'mhartington/formatter.nvim'

" auto closing tags
Plug 'alvan/vim-closetag'

" better searching
" Need more installations
" TODO study more
Plug 'mhinz/vim-grepper'

" Window swapping
" TODO check if to be removed
Plug 'wesQ3/vim-windowswap'

" gitk for vim
" TODO what is that?
Plug 'cohama/agit.vim'

" git commits history for lines
Plug 'rhysd/git-messenger.vim'

" Make terminal vim and tmux work better together for focusing events
Plug 'tmux-plugins/vim-tmux-focus-events'

" Save session workspace
" TODO check if to be removed
Plug 'tpope/vim-obsession'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" A plugin to color colornames and codes
" TODO check if to be removed
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

" ===== CtrlSpace
" CtrlSpace plugin fix for neovim
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
