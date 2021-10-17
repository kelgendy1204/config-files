nnoremap <c-p> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <c-g> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>fm <cmd>lua require('telescope.builtin').keymaps()<cr>

nnoremap <leader>fgc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>fgb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>fgd <cmd>lua require('telescope.builtin').git_bcommits()<cr>
nnoremap <leader>fgs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>fgz <cmd>lua require('telescope.builtin').git_stash()<cr>

let g:which_key_map.f = {
      \ 'name'  : '+telescope' ,
      \ 'f'     : [':execute "lua require(\"telescope.builtin\").find_files()"'        , 'Find files'],
      \ 'b'     : [':execute "lua require(\"telescope.builtin\").buffers()"'           , 'Buffers'],
      \ 'h'     : [':execute "lua require(\"telescope.builtin\").help_tags()"'         , 'Tags'],
      \ 's'     : [':execute "lua require(\"telescope.builtin\").grep_string()"'       , 'Grep String'],
      \ 'm'     : [':execute "lua require(\"telescope.builtin\").keymaps()"'           , 'Key Maps'],
      \ 'gc'     : [':execute "lua require(\"telescope.builtin\").git_commits()"'      , 'Commits'],
      \ 'gb'     : [':execute "lua require(\"telescope.builtin\").git_branches()"'     , 'Branches'],
      \ 'gd'     : [':execute "lua require(\"telescope.builtin\").git_bcommits()"'     , 'Buffer Commits'],
      \ 'gs'     : [':execute "lua require(\"telescope.builtin\").git_status()"'       , 'Git Status'],
      \ 'gz'     : [':execute "lua require(\"telescope.builtin\").git_stash()"'        , 'Git Stash'],
      \ }
