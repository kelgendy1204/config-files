call which_key#register(',', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey  ','<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual  ','<CR>
let g:which_key_map = {}

call which_key#register('<Space>', "g:which_key_space")
nnoremap <silent> <localleader> :<c-u>WhichKey  '<Space>'<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual  '<Space>'<CR>
let g:which_key_space = {}
