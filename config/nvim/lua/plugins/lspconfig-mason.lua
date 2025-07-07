return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            "mason-org/mason.nvim",
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim"
        },
        config = function()
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                local nmap = function(keys, func, desc)
                    if desc then
                        desc = 'LSP: ' .. desc
                    end
                    vim.keymap.set('n', keys, func, { noremap = true, silent = true, buffer = bufnr, desc = desc })
                end

                -- Diagnostic keymaps
                nmap('[d', vim.diagnostic.goto_prev, '[P]revious [D]iagnostic')
                nmap(']d', vim.diagnostic.goto_next, '[N]ext [D]iagnostic')
                nmap('<localleader>e', vim.diagnostic.open_float, '[O]pen [F]loat [D]iagnostic')
                nmap('<localleader>q', vim.diagnostic.setloclist, '[S]et [L]oclist [D]iagnostic')

                nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
                nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
                nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')

                nmap('<C-k>', vim.lsp.buf.signature_help, '[S]ignature [H]elp')
                nmap('<localleader>wa', vim.lsp.buf.add_workspace_folder, '[A]dd [W]orkspace [F]older')
                nmap('<localleader>wr', vim.lsp.buf.remove_workspace_folder, '[R]emove [W]orkspace [F]older')
                nmap('<localleader>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, '[L]ist [W]orkspace [F]olders')

                nmap('<localleader>D', vim.lsp.buf.type_definition, '[T]ype [D]efinition')
                nmap('<localleader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                nmap('<localleader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
                nmap('gr', vim.lsp.buf.references, '[R]eferences')
                nmap('<localleader>f', function() vim.lsp.buf.format({ async = true }) end, '[F]ormat')
            end

            local masonLspconfig = require('mason-lspconfig')
            masonLspconfig.setup()

            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require('lspconfig')

            -- mason-lspconfig v2.x exposes installed servers here:
            for _, server_name in ipairs(masonLspconfig.get_installed_servers()) do
                lspconfig[server_name].setup {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }
            end

            -- Setup efm-langserver configuration
            require('config.lsp-efm')
        end
    }
}
