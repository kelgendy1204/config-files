let g:floaterm_keymap_toggle = '<Leader>tt'
let g:floaterm_keymap_new = '<Leader>tn'
let g:floaterm_keymap_kill = '<Leader>tk'
let g:floaterm_opener = 'edit'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
let g:floaterm_autoclose = 1
let g:floaterm_title = '($1/$2)'

command! Ranger FloatermNew ranger
command! FZF FloatermNew fzf
nnoremap <silent> <leader>tr :Ranger<CR>
