---@diagnostic disable: undefined-global
local FTerm = require('FTerm')

FTerm.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

vim.keymap.set('n', '<Leader>ft', FTerm.toggle, { desc = '[F]loatterm [T]oggle' })
vim.keymap.set('n', '<Leader>fn', FTerm.open, { desc = '[F]loatterm [O]pen' })
vim.keymap.set('n', '<Leader>fk', FTerm.exit, { desc = '[F]loatterm [E]xit' })
