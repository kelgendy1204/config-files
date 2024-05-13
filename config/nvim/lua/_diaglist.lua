---@diagnostic disable: undefined-global
local diaglist = require("diaglist")

diaglist.init({
    -- optional settings
    -- below are defaults
    debug = false,

    -- increase for noisy servers
    debounce_ms = 150,
})

vim.keymap.set('n', '<localleader>dw', diaglist.open_all_diagnostics, { desc = 'Open all diagnostics' })
vim.keymap.set('n', '<localleader>d0', diaglist.open_buffer_diagnostics, { desc = 'Open buffer diagnostics' })
