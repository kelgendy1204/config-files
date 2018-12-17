" required for Vundle starting
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Indent lines
Plugin 'Yggdroot/indentLine'

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

" For buffers handling, extracting them to tabs, name the tabs and moving them
Plugin 'vim-ctrlspace/vim-ctrlspace'

" Prettier plugin
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }

" TODO
" Tabbar plugin
" Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()

source ~/.vimsettings

source ~/.vimkeymapping
