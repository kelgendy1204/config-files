---@diagnostic disable: undefined-global
local util = require "formatter.util"

local prettier = {
    -- prettier
    function()
        return {
            exe = "prettier",
            args = {
                "--stdin-filepath",
                util.escape_path(util.get_current_buffer_file_path()),
            },
            stdin = true,
            try_node_modules = true,
        }
    end
}

require("formatter").setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        typescriptreact = prettier,
        typescript = prettier,
        javascript = prettier,
        javascriptreact = prettier,
        json = prettier,
        markdown = prettier,
    }
})

vim.api.nvim_set_keymap('n', '<leader><leader>f', '<cmd>Format<cr>', { noremap = true, silent = true })
