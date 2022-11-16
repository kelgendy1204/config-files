" NvimTreeOpen, NvimTreeClose, NvimTreeFocus and NvimTreeResize are also available if you need them
nnoremap <leader>ne :NvimTreeToggle<CR>
nnoremap <leader>nf :NvimTreeFindFile<CR>

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeSymlink guifg=blue gui=bold,underline
