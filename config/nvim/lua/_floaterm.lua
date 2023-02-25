---@diagnostic disable: undefined-global
local FTerm = require('FTerm')

FTerm.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

vim.keymap.set('n', '<Leader>tt', FTerm.toggle)
vim.keymap.set('n', '<Leader>tn', FTerm.open)
vim.keymap.set('n', '<Leader>tk', FTerm.exit)
-- let g:floaterm_title = '($1/$2)'
