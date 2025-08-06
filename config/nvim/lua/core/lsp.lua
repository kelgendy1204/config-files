local nmap = require("utils.nmap")

vim.lsp.enable({
    'lua_ls',
    'ts_ls',
    'cssmodules_ls',
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        nmap('<localleader>e', vim.diagnostic.open_float, '[O]pen [F]loat [D]iagnostic')
        nmap('<localleader>q', vim.diagnostic.setloclist, '[S]et [L]oclist [D]iagnostic')
    end,
})

vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = false,
    underline = false,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
        },
    }
})
