" Set all .vim* file to vim syntax
au BufReadPost *.vim* set syntax=vim

" It turns on 'detection', 'plugin' and 'indent' at once.
" Allows auto-indenting depending on file type
filetype plugin indent on

" Vim already set it
" set nocompatible

" Set syntax on for all files
syntax on

" enable bold and italic in colorscheme
let g:enable_bold_font   = 1
let g:enable_italic_font = 1

" Possibility to have more than one unsaved buffers.
" Also For coc if hidden is not set, TextEdit might fail.
set hidden

" Turn Off Swap Files
" Also For coc Some servers have issues with backup files, see #649
set noswapfile
set nowb
set nobackup
set nowritebackup

" For displaying messages
set cmdheight=1

" remove ins-completion-menu messages.
set shortmess+=c

" Show vim mode
set showmode

" To do automatically load changes set autoread then
" Triger `autoread` when files changes on disk then
" Notification after file change
" Exclude in command line
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if expand('%') !=# '[Command Line]' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Files encoding
set encoding=utf-8

" Saving strategy
set backupcopy=yes

" Set color to 256 colors
set t_Co=256

" For breaking a line not a word
set linebreak

" Wrap lines
set wrap

" set listchars=space:.,tab:>-
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·

" To display the status line always
set laststatus=2

" Highlight while search
set incsearch

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

" Always set autoindenting on
set autoindent

" Smart indent
set smartindent

" Copy the previous indentation on autoindenting
set copyindent

" Set show matching parenthesis
set showmatch

" Search/replace globally (on a line) by default
set gdefault

" Automatically reload files changed outside of Vim
set autoread

" Make the keyboard fast
set ttyfast
set timeout ttimeoutlen=50 timeoutlen=500

" Change swap files, backup files and undo files to another directory
set backupdir=~/.vim/temp//
set directory=~/.vim/temp//
set undodir=~/.vim/temp//

" Remember more commands and search history
set history=1000

" Use many muchos levels of undo
set undolevels=1000

" Great command-line completion, use '<Tab>' to move around and '<CR>' to validate"
" Make use of the 'status line' to show possible completions of command line commands, file names, and more
set wildmenu
set wildmode=longest,list,full

" Shows the current line number at the bottom. right of the screen.
set ruler

" Turn off tabline
set showtabline=1

" Highlight the current line
set cursorline

" no visual bell & flash
set noerrorbells
set vb t_vb=
set belloff=all

" Folding
" Makes sure that when opening, files are "normal", i.e. not folded.
set nofoldenable

" Fold method by syntax or indent or manual
set foldmethod=manual

" Fold level and nesting
set foldlevel=1
set foldnestmax=10

" enable reading .vimrc/.exrc/.gvimrc in the current directory = local custom config
set exrc

" Return cursor to its default style
set guicursor=

" number of screen lines to show around the cursor
set scrolloff=10

" not displaying the current mode in the status line
set noshowmode
