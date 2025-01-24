require('spectre').setup()

---@diagnostic disable: undefined-global
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    noremap = true,
    silent = true,
    buffer = bufnr,
    desc = 'Toggle Spectre'
})

vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    noremap = true,
    silent = true,
    buffer = bufnr,
    desc = 'Search current word'
})

vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    noremap = true,
    silent = true,
    buffer = bufnr,
    desc = 'Search current word'
})

vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    noremap = true,
    silent = true,
    buffer = bufnr,
    desc = 'Search on current file'
})
