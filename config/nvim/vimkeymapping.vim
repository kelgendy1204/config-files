" All keymapping are in this file

" ===================================================================== "
" Keymapping for vim only without plugins
" ===================================================================== "

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Apply Q macro record
nnoremap Q @q

" Easier bookmarking
nnoremap M `m

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Use (ctrl + ^) to toggle the uppercase of the letters
" Fixing caps lock problem in normal mode
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
    execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
    execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor
" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0
" Set following to show "<CAPS>" in the status line when "Caps Lock" is on.
let b:keymap_name = "CAPS"
" Show b:keymap_name in status line.
set statusline^=%k

" Move normally between wrapped lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Redraw page
nnoremap <Leader><Leader>r :redraw!<CR>

" Don't want to jump to the first result automatically.
cnoreabbrev Ack Ack!
" Map Ack
nnoremap <Leader>a :Ack!<Space>-i<Space>

" Search will center on the line it's found in.
nnoremap n nzz
nnoremap N Nzz

" Scrolling
nnoremap <C-e> j<C-e>
nnoremap <C-y> k<C-y>

" Navigate between panes
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Resize splitting windows vertically
nnoremap <C-Left> :vertical resize -5<CR>
nnoremap <C-Right> :vertical resize +5<CR>

" Resize splitting windows horizontally
nnoremap <C-Up> :resize +5<CR>
nnoremap <C-Down> :resize -5<CR>

" Quickly close the current window
nnoremap <leader>q :q<CR>

" close all except the current window
nnoremap <leader>o :only<CR>

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Updating mapping
nnoremap <leader>u :update<cr>

" Saving mapping
nnoremap <leader>w :w<cr>

" Write all buffers
nnoremap <leader>W :wall<cr>

" Paste and indent text
nnoremap gp p`[v`]=

" Yank to the end of the line
nnoremap Y y$

" split screen vertically
nnoremap <leader>vv :vs<CR>

" split screen horizontally
nnoremap <leader>hh :sp<CR>

" Repalce word with a yanked words without replacing it
nnoremap <leader>r viwp`[v`]y

" Repalce a selected paragraph with a yanked words without replacing it
vnoremap <leader>r p`[v`]y

" Black hole delete in normal mode
nnoremap <leader>d "_d

" Black hole delete to the end of the line
nnoremap <leader>D "_D

" Black hole delete in visual mode
vnoremap <leader>d "_d

" Handling clipboard coping - vim-gnome is required
" Copy to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Copy to clipboard in normal mode to the end of the line
nnoremap <leader>Y "+y$
nnoremap <leader>yy "+yy

" Handling clipboard pasting - vim-gnome is required
" Copy to clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Copy to clipboard in normal mode before cursor
nnoremap <leader>P "+P
vnoremap <leader>P "+P

" Copy to clipboard in normal mode before cursor and make the cursor after the text
nnoremap <leader>gP "+gP
vnoremap <leader>gP "+gP

" Enter paste mode
set pastetoggle=<F10>

" 'cd' towards the dir in which the current file is edited
" but only change the path for the current window
map <silent> <leader>cd :lcd %:h<CR>

" Normal mode switch for termial mode
tnoremap <Esc> <C-\><C-n>

" Start and end of line
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

" Remap omnifunc to ctrl + space
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" Remap esc for macos
:imap jk <Esc>
:imap kj <Esc>
