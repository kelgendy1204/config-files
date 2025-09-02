-- gruvbox theme
return {
    -- use 'luisiacc/gruvbox-baby'
    'ellisonleao/gruvbox.nvim',
    config = function()
        vim.cmd[[colorscheme gruvbox]]
    end,
}

-- tokyonight theme
-- return {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {},
--     config = function()
--         vim.cmd [[colorscheme tokyonight-storm]]
--     end,
-- }
--
-- vscode theme
-- return {
--     'Mofiqul/vscode.nvim',
--     lazy = false,
--     priority = 1000,
--     opts = {},
--     config = function()
--         vim.o.background = 'dark'
--         vim.cmd [[colorscheme vscode]]
--     end,
-- }
