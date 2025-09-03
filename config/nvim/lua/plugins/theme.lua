return {
    'luisiacc/gruvbox-baby',
    'ellisonleao/gruvbox.nvim',
    {
        'Mofiqul/vscode.nvim',
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.o.background = 'dark'
            vim.cmd [[colorscheme vscode]]
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        -- config = function()
        --     vim.cmd [[colorscheme tokyonight-storm]]
        -- end,
    },
}
