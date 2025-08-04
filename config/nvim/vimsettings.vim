" Set all .vim* file to vim syntax
au BufReadPost *.vim* set syntax=vim

" enable bold and italic in colorscheme
let g:enable_bold_font   = 1
let g:enable_italic_font = 1

" Turn Off Swap Files
set noswapfile
set nobackup
set nowritebackup

" remove ins-completion-menu messages.
set shortmess+=c

" Auto-reload files changed outside of Neovim
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if expand('%') !=# '[Command Line]' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" For breaking a line not a word
set linebreak

" Show invisible characters
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·

" insert tabs on the start of a line according to context
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

" Smart indent
set smartindent

" Copy the previous indentation on autoindenting
set copyindent

" Set show matching parenthesis
set showmatch

" Search/replace globally (on a line) by default
set gdefault

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

" Great command-line completion
set wildmenu
set wildmode=longest,list,full

" Turn off tabline when only one tab
set showtabline=1

" Highlight the current line
set cursorline

" no visual bell & flash
set noerrorbells
set visualbell t_vb=
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
