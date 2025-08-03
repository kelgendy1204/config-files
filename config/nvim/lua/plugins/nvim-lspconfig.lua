return {
    'neovim/nvim-lspconfig',
    config = function()
        -- LSP (Language Server Protocol) configuration
        vim.lsp.enable({
            'lua_ls',
            'ts_ls'
        })
    end
}
