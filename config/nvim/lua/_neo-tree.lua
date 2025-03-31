---@diagnostic disable: undefined-global

vim.keymap.set('n', '<leader>ne', ':Neotree filesystem toggle left<cr>', { desc = 'Toggle File Explorer' })
vim.keymap.set('n', '<leader>nf', ':Neotree filesystem reveal left<cr>', { desc = 'Open Current Buffer' })
vim.keymap.set('n', '<leader>ng', ':Neotree git_status float<cr>', { desc = 'Open Git Status' })
vim.keymap.set('n', '<c-space>', ':Neotree buffers float<cr>', { desc = 'Open Buffer' })

require("neo-tree").setup({
    window = {
        mappings = {
            ["b"] = "noop",
        },
    },
    filesystem = {
        window = {
            mappings = {
                ["/"] = "noop",
            },
        },
    },
})
