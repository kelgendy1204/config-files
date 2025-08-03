return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = {
                "bash",
                "css",
                "diff",
                "dockerfile",
                "gitcommit",
                "go",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "typescript",
            },

            incremental_selection = { enable = true },
            highlight = { enable = true },
            indent = { enable = true },
            textobjects = { enable = true },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,
            auto_install = true,
            ignore_install = {},
            modules = {},
        }
    end
}
