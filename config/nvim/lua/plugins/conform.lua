local nmap = require("utils.nmap")

return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        local conform = require('conform')
        conform.setup({
            formatters_by_ft = {
                css = { 'prettier' },
                javascript = { 'prettier' },
                typescript = { 'prettier' },
                javascriptreact = { 'prettier' },
                typescriptreact = { 'prettier' },
            },
        })

       nmap('<localleader>f', function()
            -- Format using conform, and fallback to native LSP formatter
            -- if no conform formatters are available
            conform.format({ lsp_fallback = true })

            -- Make sure to map to the native LSP format function if conform removed in the future
            -- vim.lsp.buf.format({ async = true })
        end, 'Format')
    end,
}
