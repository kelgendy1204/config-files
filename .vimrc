" ====================================================== "
" ====================================================== "
" ============== Vim only settings ===================== "
" ====================================================== "
" ====================================================== "

" import vim settings file
source ~/.config/nvim/.vimsettings

" import vim plugins file with its settings and mappings
source ~/.config/nvim/.vimplugins

" import vim mapping file
source ~/.config/nvim/.vimkeymapping

" Workaround solution to make alt key works
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

" ====================================================== "
" Vim Plugins and settings
" ====================================================== "

" Fix ctrl + arrow issue with tmux
set term=xterm-256color

" Display tooltip window about symbol under the mouse cursor
set ballooneval
autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()
autocmd FileType typescript nmap <buffer> <Leader>sy : <C-u>echo tsuquyomi#hint()<CR>

" ====================================================== "
" Vim Themes
" ====================================================== "

" colorscheme solarized
" set background=dark
" let g:solarized_contrast='high'
" let g:solarized_termcolors=256
" let g:airline_solarized_bg='dark'

" hybrid theme
" set background=dark
" colorscheme hybrid_material
" let g:airline_theme = 'hybrid'

" ===== PaperColor theme
set background=dark
colorscheme PaperColor
let g:airline_theme = 'papercolor'

" set termguicolors
" let ayucolor="dark"
" let ayucolor="light"
" let ayucolor="mirage"
" colorscheme ayu

" One dark theme setup
" "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
" "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX))
"   if (has("nvim"))
"     "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   endif
"   "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"   "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"   " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"   if (has("termguicolors"))
"     set termguicolors
"   endif
" endif
