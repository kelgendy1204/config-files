---@diagnostic disable: undefined-global

local telescope = require('telescope')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<c-p>', builtin.git_files, { desc = '[S]earch [G]it [F]iles' })
vim.keymap.set('n', '<c-g>', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = '[T]elescope Search [F]iles' })
vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = '[T]elescope Search [H]elp' })
vim.keymap.set('n', '<leader>tw', builtin.grep_string, { desc = '[T]elescope Search current [W]ord' })
vim.keymap.set('n', '<leader>td', builtin.diagnostics, { desc = '[T]elescope Search [D]iagnostics' })
vim.keymap.set('n', '<leader>tr', builtin.registers, { desc = '[T]elescope Search [R]egisters' })
vim.keymap.set('n', '<leader>tm', builtin.keymaps, { desc = '[T]elescope Search [M]aps' })

telescope.setup {
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown { }
        }
    }
}

-- get ui-select loaded and working with telescope, you need to call
telescope.load_extension("ui-select")

-- Enable telescope fzf native, if installed
pcall(telescope.load_extension, 'fzf')
