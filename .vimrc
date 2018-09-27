set nocompatible

syntax on

set showmode

filetype off

set encoding=utf-8

" Set color to 256 colors
set t_Co=256

" Always show line numbers
set number

" How the line numbers relative to the current line
" set relativenumber

set list

" set listchars=space:.,tab:>-
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·

set laststatus=2

" Enable Highlight Search
set hlsearch

" Highlight while search
set incsearch

" Case Insensitivity Pattern Matching
set ignorecase

" Overrides ignorecase if pattern contains upcase
set smartcase

" insert tabs on the start of a line according to
set smarttab

" Width of tab character
set tabstop=4

" Fine tunes the amount of white space to be added
set softtabstop=4

" Determines the amount of whitespace to add in normal mode
set shiftwidth=4

" When on uses space instead of tabs
set expandtab

" Splitting locations
set splitbelow
set splitright

" always set autoindenting on
set autoindent

" copy the previous indentation on autoindenting
set copyindent

" set show matching parenthesis
set showmatch

" search/replace globally (on a line) by default
set gdefault

" automatically reload files changed outside of Vim
set autoread

" Speed up the updatetime so gitgutter and friends are quicker
set updatetime=1000

" Make the keyboard fast
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50

" Change the mapleader from \ to ,
let mapleader=","

" remember more commands and search history
set history=1000

" use many muchos levels of undo
set undolevels=1000

" Great command-line completion, use '<Tab>' to move around and '<CR>' to validate"
set wildmenu

" Shows the current line number at the bottom. right of the screen.
set ruler

" Possibility to have more than one unsaved buffers.
set hidden

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Bottom bar theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" For navigation tree
Plugin 'scrooloose/nerdtree'

" For nerdtree with git integration
Plugin 'Xuyuanp/nerdtree-git-plugin'

" For comments
Plugin 'scrooloose/nerdcommenter'

" For syntax of any kind of files
Plugin 'scrooloose/syntastic'

" For javascript sytanx
Plugin 'pangloss/vim-javascript'

" For react sytanx
Plugin 'mxw/vim-jsx'

" For file open in directory
Plugin 'kien/ctrlp.vim'

" Hybrid theme
Plugin 'kristijanhusak/vim-hybrid-material'

" Solarized theme
Plugin 'altercation/vim-colors-solarized'

" Gruvbox theme
Plugin 'morhetz/gruvbox'

" PaperColor theme
Plugin 'NLKNguyen/papercolor-theme'

" ayu theme
Plugin 'ayu-theme/ayu-vim'

" Surround code with anything
Plugin 'tpope/vim-surround'

" For git gutter
Plugin 'airblade/vim-gitgutter'

" For eslint integration
Plugin 'w0rp/ale'

" For project global search
Plugin 'mileszs/ack.vim'

" For brackets pairing
Plugin 'jiangmiao/auto-pairs'

" For git integration
Plugin 'tpope/vim-fugitive'

" Fuzzy search for color schemes
Plugin 'flazz/vim-colorschemes'

" For multicursors
Plugin 'terryma/vim-multiple-cursors'

" Other snippets
Plugin 'honza/vim-snippets'

" Vim script for text filtering and alignment
Plugin 'godlygeek/tabular'

" Vim snippets
Plugin 'SirVer/ultisnips'

" React snippets
Plugin 'epilande/vim-react-snippets'

" Auto completion plugin
Plugin 'Valloric/YouCompleteMe'

" TODO
" Tabbar plugin
" Plugin 'majutsushi/tagbar'

" Perform all your vim insert mode completions with Tab
" Plugin 'ervandew/supertab'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" airline config
let g:airline_powerline_fonts            = 1
let g:airline#extensions#tabline#enabled = 1

" enable bold and italic
let g:enable_bold_font   = 1
let g:enable_italic_font = 1

" gitgutter configuration
let g:gitgutter_enabled       = 1
let g:gitgutter_signs_enabled = 1

" ctrlp configuration
let g:ctrlp_show_hidden   = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_max_files     = 0

" nerdtree configuration
let g:NERDSpaceDelims    = 1
let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeChDirMode  = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore     = ['\.swp$']

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<c-j>"

" colorscheme solarized
" set background=dark
" let g:solarized_contrast='high'
" let g:solarized_termcolors=256
" let g:airline_solarized_bg='dark'

" hybrid theme
" set background=dark
" colorscheme hybrid_material
" let g:airline_theme = 'hybrid'

" gruvbox theme
" colorscheme gruvbox
" set background=dark
" let g:gruvbox_bold = 1
" let g:gruvbox_italic = 1
" let g:gruvbox_contrast_dark = 'hard'

" PaperColor theme
set background=dark
colorscheme PaperColor
let g:airline_theme='papercolor'

" set termguicolors
" let ayucolor="dark"
" let ayucolor="light"
" let ayucolor="mirage"
" colorscheme ayu

" Toggle nerd tree with ctrl + space
noremap <leader>ne :NERDTreeToggle<CR>

" Remove highlights for search
nnoremap <silent> <leader><space> :nohlsearch<cr>

" Easily create a new tab.
noremap <Leader>tn :tabnew<CR>

" Easily close a tab.
noremap <Leader>tc :tabclose<CR>

" Easily move a tab.
noremap <Leader>tm :tabmove<CR>

" Toggle Relative Number
nnoremap <silent> <leader>nb :set relativenumber!<CR>

" Show all buffers
nnoremap <silent> <leader>b :buffers<CR>:buffer<Space>

" map escape key
inoremap jj <Esc>

" Scrolling
nnoremap <C-e> j<C-e>
nnoremap <C-y> k<C-y>

" Navigate between panes
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" Change git gutter mapping to avoid conflicts with changing buffers
nmap ghp <Plug>GitGutterPreviewHunk
nmap ghs <Plug>GitGutterStageHunk
nmap ghu <Plug>GitGutterUndoHunk

" Navigate between buffers
noremap <C-l> :bn<CR>
noremap <C-h> :bp<CR>

" Resize splitting windows vertically
nnoremap <C-Right> :resize +5<CR>
nnoremap <C-Left> :resize -5<CR>

" Resize splitting windows horizontally
nnoremap + :vertical resize +5<CR>
nnoremap - :vertical resize -5<CR>

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Quickly close the current buffer
nnoremap <leader>c :bd<CR>

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Updating mapping
nnoremap <leader>u :update<cr>

" Saving mapping
nnoremap <leader>w :w<cr>

" Paste and indent text
nnoremap gp p`[v`]=

" Yank to the end of the line
nnoremap Y y$

" Tabularize -^-
nnoremap <Leader>t :Tab<Space>/
vnoremap <Leader>t :Tab<Space>/

" TODO
" Toggle tagbar
" nnoremap <leader>t :TagbarToggle<CR>

" Enter paste mode
set pastetoggle=<leader>p

filetype plugin on
