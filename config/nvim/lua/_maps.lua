---@diagnostic disable: undefined-global
vim.keymap.set("n", "<leader>cs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Remap leader keys
vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Moving lines in all modes
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")

-- Remove highlights for search
vim.keymap.set("n", "<localleader>s", ":nohlsearch<cr>")
