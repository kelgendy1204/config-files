nnoremap <c-p> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <c-g> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>fm <cmd>lua require('telescope.builtin').keymaps()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').registers()<cr>

nnoremap <leader>fgc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>fgb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>fgd <cmd>lua require('telescope.builtin').git_bcommits()<cr>
nnoremap <leader>fgs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>fgz <cmd>lua require('telescope.builtin').git_stash()<cr>
