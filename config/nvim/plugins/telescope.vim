nnoremap <c-p> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <c-g> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>fB <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').git_bcommits()<cr>

let g:which_key_map.f = {
      \ 'name'  : '+telescope' ,
      \ 'f'     : [':execute "lua require(\"telescope.builtin\").find_files()"'        , 'Find files'],
      \ 'b'     : [':execute "lua require(\"telescope.builtin\").buffers()"'           , 'Buffers'],
      \ 'h'     : [':execute "lua require(\"telescope.builtin\").help_tags()"'         , 'Tags'],
      \ 's'     : [':execute "lua require(\"telescope.builtin\").grep_string()"'       , 'Grep String'],
      \ 'c'     : [':execute "lua require(\"telescope.builtin\").git_commits()"'       , 'Commits'],
      \ 'B'     : [':execute "lua require(\"telescope.builtin\").git_branches()"'       , 'Branches'],
      \ 'd'     : [':execute "lua require(\"telescope.builtin\").git_bcommits()"'      , 'Buffer Commits'],
      \ }
