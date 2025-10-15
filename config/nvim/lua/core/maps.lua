-- Remap leader keys
vim.g.mapleader = ","
vim.g.maplocalleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Moving lines in all modes
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("n", "<A-k>", ":m .-2<CR>==")

-- remove the default <Space> mapping
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Search for visually selected text
keymap('v', '*', 'y/\\V<C-R>=escape(@","/\\\\")<CR><CR>', { silent = true })
keymap('v', '#', 'y?\\V<C-R>=escape(@","?\\\\")<CR><CR>', { silent = true })

-- Apply Q macro record
keymap('n', 'Q', '@q', opts)

-- Easier bookmarking
keymap('n', 'M', '`m', opts)

-- TAB in normal mode to move to next/prev buffer
keymap('n', '<Tab>', ':bnext<CR>', opts)
keymap('n', '<S-Tab>', ':bprevious<CR>', opts)

-- Move normally between wrapped lines
keymap({ 'n', 'v' }, 'j', 'gj', opts)
keymap({ 'n', 'v' }, 'k', 'gk', opts)

-- Search centers on result
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)

-- Scrolling
keymap('n', '<C-e>', 'j<C-e>', opts)
keymap('n', '<C-y>', 'k<C-y>', opts)
keymap('n', '<C-e>', '2<C-e>', opts)
keymap('n', '<C-y>', '2<C-y>', opts)

-- Navigate between window panes
keymap('n', '<C-j>', '<C-w><C-j>', opts)
keymap('n', '<C-k>', '<C-w><C-k>', opts)
keymap('n', '<C-l>', '<C-w><C-l>', opts)
keymap('n', '<C-h>', '<C-w><C-h>', opts)

-- Resize splits
keymap('n', '<C-Left>', ':vertical resize -5<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +5<CR>', opts)
keymap('n', '<C-Up>', ':resize +5<CR>', opts)
keymap('n', '<C-Down>', ':resize -5<CR>', opts)

-- Shortcuts with descriptions
keymap('n', '<Leader>q', ':q<CR>', { silent = true, desc = "Close window" })
keymap('n', '<Leader>o', ':only<CR>', { silent = true, desc = "Close other windows" })
keymap('n', '<Leader>u', ':update<CR>', { silent = true, desc = "Update file" })
keymap('n', '<Leader>w', ':w<CR>', { silent = true, desc = "Write file" })
keymap('n', '<Leader>W', ':wall<CR>', { silent = true, desc = "Write all files" })
keymap('n', 'gp', 'p`[v`]=', { silent = true, desc = "Paste and indent" })
keymap('n', '<Leader><Leader>r', ':redraw!<CR>', { silent = true, desc = "Redraw screen" })
keymap("n", "<leader>s", ":nohlsearch<cr>", { silent = true, desc = "Clear highlights" })
keymap("n", "<leader>cp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Buffer replace word" })
keymap('n', '<Leader>vv', ':vs<CR>', { silent = true, desc = "Vertical split" })
keymap('n', '<Leader>hh', ':sp<CR>', { silent = true, desc = "Horizontal split" })
keymap('n', '<Leader>r', 'viwp`[v`]y', { silent = true, desc = "Replace word" })
keymap('v', '<Leader>r', 'p`[v`]y', { silent = true, desc = "Replace selection" })
keymap('n', '<Leader>d', '"_d', { silent = true, desc = "Delete without yank" })
keymap('n', '<Leader>D', '"_D', { silent = true, desc = "Delete to end of line without yank" })
keymap('v', '<Leader>d', '"_d', { silent = true, desc = "Delete selection without yank" })
keymap('n', '<Leader>y', '"+y', { silent = true, desc = "Yank to system clipboard" })
keymap('v', '<Leader>y', '"+y', { silent = true, desc = "Yank selection to system clipboard" })
keymap('n', '<Leader>Y', '"+y$', { silent = true, desc = "Yank to end of line to system clipboard" })
keymap('n', '<Leader>yy', '"+yy', { silent = true, desc = "Yank line to system clipboard" })
keymap('n', '<Leader>p', '"+p', { silent = true, desc = "Paste from system clipboard" })
keymap('v', '<Leader>p', '"+p', { silent = true, desc = "Paste from system clipboard" })
keymap('n', '<Leader>P', '"+P', { silent = true, desc = "Paste before from system clipboard" })
keymap('v', '<Leader>P', '"+P', { silent = true, desc = "Paste before from system clipboard" })

-- Yank to end of the line
keymap('n', 'Y', 'y$', opts)

-- Start and end of line
keymap({ 'n', 'v' }, 'H', '^', opts)
keymap({ 'n', 'v' }, 'L', '$', opts)

-- Remap omnifunc to ctrl + space
keymap('i', '<C-Space>', '<C-x><C-o>', opts)

-- Remap esc in insert mode
vim.cmd('inoremap jk <esc>')
vim.cmd('inoremap kj <esc>')
