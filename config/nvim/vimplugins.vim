" ============== Grepper
" In normal and visual mode, the operator gs takes any motion and uses that selection to populate the search prompt (Using grepper).
" The query is quoted automatically.
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" ============== multi_cursor
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
