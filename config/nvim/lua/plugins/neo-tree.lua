return {
    -- If you want neo-tree's file operations to work with LSP (updating imports, etc.), you can use a plugin like
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-neo-tree/neo-tree.nvim",
        },
        config = function()
            require("lsp-file-operations").setup()
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            {
                "s1n7ax/nvim-window-picker", -- for open_with_window_picker keymaps
                version = "2.*",
                config = function()
                    require("window-picker").setup({
                        filter_rules = {
                            include_current_win = false,
                            autoselect_one = true,
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { "neo-tree", "neo-tree-popup", "notify" },
                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { "terminal", "quickfix" },
                            },
                        },
                    })
                end,
            },
        },
        lazy = false,
        config = function()
            require("neo-tree").setup({
                window = {
                    mappings = {
                        ["b"] = "noop",
                    },
                },
                filesystem = {
                    window = {
                        mappings = {
                            ["/"] = "noop",
                        },
                    },
                },
            })

            vim.keymap.set('n', '<leader>ne', ':Neotree filesystem toggle left<cr>', { desc = 'Toggle File Explorer' })
            vim.keymap.set('n', '<leader>nf', ':Neotree filesystem reveal left<cr>', { desc = 'Open Current Buffer' })
            vim.keymap.set('n', '<leader>ng', ':Neotree git_status float<cr>', { desc = 'Open Git Status' })
            vim.keymap.set('n', '<c-space>', ':Neotree buffers float<cr>', { desc = 'Open Buffer' })
        end,
    },
}
