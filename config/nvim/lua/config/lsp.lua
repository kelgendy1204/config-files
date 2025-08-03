vim.lsp.enable({
    'lua_ls',
    'ts_ls'
})

local nmap = function(keys, func, desc)
    if desc then
        desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { noremap = true, silent = true, desc = desc })
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        nmap('<localleader>e', vim.diagnostic.open_float, '[O]pen [F]loat [D]iagnostic')
        nmap('<localleader>q', vim.diagnostic.setloclist, '[S]et [L]oclist [D]iagnostic')
        nmap('<localleader>f', function() vim.lsp.buf.format({ async = true }) end, '[F]ormat')
    end,
})
