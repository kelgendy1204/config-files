" ====================================================== "
" Vim only settings
" ====================================================== "

" Fix ctrl + arrow issue with tmux
set term=xterm-256color

" ====================================================== "

" import vim settings file
source ~/.vimsettings

" import vim plugins file with its settings and mappings
source ~/.vimplugins

" import vim mapping file
source ~/.vimkeymapping

" Workaround solution to make alt key works
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
