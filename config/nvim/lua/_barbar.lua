---@diagnostic disable: undefined-global
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Magic buffer-picking mode
map('n', '<Space>bp', ':BufferPick<CR>', opts)

-- Which key mapping
local wk = require("which-key")
wk.add({
    { "<localleader>b", group = "buffers" },
    { "<localleader>bp", "<cmd>BufferPick<CR>", desc = "Buffer Pick" },
})

vim.g.barbar_auto_setup = false -- disable auto-setup
require 'barbar'.setup {}
