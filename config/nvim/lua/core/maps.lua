-- Remap leader keys
vim.g.mapleader = ","
vim.g.maplocalleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Moving lines in all modes
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")

-- Remove highlights for search
vim.keymap.set("n", "<localleader>s", ":nohlsearch<cr>")
vim.keymap.set("n", "<leader>cp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- remove the default <Space> mapping
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Search for visually selected text
vim.keymap.set('v', '*', 'y/\\V<C-R>=escape(@","/\\\\")<CR><CR>', { silent = true })
vim.keymap.set('v', '#', 'y?\\V<C-R>=escape(@","?\\\\")<CR><CR>', { silent = true })

-- Apply Q macro record
keymap('n', 'Q', '@q', opts)

-- Easier bookmarking
keymap('n', 'M', '`m', opts)

-- TAB in normal mode to move to next/prev buffer
keymap('n', '<Tab>', ':bnext<CR>', opts)
keymap('n', '<S-Tab>', ':bprevious<CR>', opts)

-- Move normally between wrapped lines
keymap({'n', 'v'}, 'j', 'gj', opts)
keymap({'n', 'v'}, 'k', 'gk', opts)

-- Redraw page
keymap('n', '<Leader><Leader>r', ':redraw!<CR>', opts)

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

-- Quickly close window/buffer
keymap('n', '<Leader>q', ':q<CR>', opts)
keymap('n', '<Leader>o', ':only<CR>', opts)

-- Updating, saving, writing
keymap('n', '<Leader>u', ':update<CR>', opts)
keymap('n', '<Leader>w', ':w<CR>', opts)
keymap('n', '<Leader>W', ':wall<CR>', opts)

-- Paste and indent text
keymap('n', 'gp', 'p`[v`]=', opts)

-- Yank to end of the line
keymap('n', 'Y', 'y$', opts)

-- Vertical/horizontal split
keymap('n', '<Leader>vv', ':vs<CR>', opts)
keymap('n', '<Leader>hh', ':sp<CR>', opts)

-- Replace word or paragraph with yanked text (without replacing default register)
keymap('n', '<Leader>r', 'viwp`[v`]y', opts)
keymap('v', '<Leader>r', 'p`[v`]y', opts)

-- Black hole deletes
keymap('n', '<Leader>d', '"_d', opts)
keymap('n', '<Leader>D', '"_D', opts)
keymap('v', '<Leader>d', '"_d', opts)

-- System clipboard yank
keymap('n', '<Leader>y', '"+y', opts)
keymap('v', '<Leader>y', '"+y', opts)
keymap('n', '<Leader>Y', '"+y$', opts)
keymap('n', '<Leader>yy', '"+yy', opts)

-- System clipboard paste
keymap('n', '<Leader>p', '"+p', opts)
keymap('v', '<Leader>p', '"+p', opts)
keymap('n', '<Leader>P', '"+P', opts)
keymap('v', '<Leader>P', '"+P', opts)
keymap('n', '<Leader>gP', '"+gP', opts)
keymap('v', '<Leader>gP', '"+gP', opts)

-- Start and end of line
keymap({'n','v'}, 'H', '^', opts)
keymap({'n','v'}, 'L', '$', opts)

-- Remap omnifunc to ctrl + space
keymap('i', '<C-Space>', '<C-x><C-o>', opts)

-- Remap esc in insert mode
vim.cmd('inoremap jk <Esc>')
vim.cmd('inoremap kj <Esc>')
