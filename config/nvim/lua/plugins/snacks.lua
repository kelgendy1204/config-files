---@diagnostic disable: undefined-global

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        input = { enabled = true },
        indent = { enabled = true, animate = { enabled = false } },
        bigfile = { enabled = true },
        animate = { enabled = false },
        dashboard = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000
        },
        explorer = {},
        picker = {
            sources = {
                explorer = {}
            }
        }
    },
    keys = {
        { "<localleader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
        { "<leader>bd",      function() Snacks.bufdelete() end,     desc = "Delete Buffer" },

        { "<leader>ne",      function() Snacks.explorer() end,      desc = "File Explorer" },
        {
            "<c-space>",
            function()
                Snacks.picker.buffers({
                    focus = 'list',
                    sort_lastused = false,
                })
            end,
            desc = "Navigate Buffers"
        },
    },
}
