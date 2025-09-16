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
        { "<localleader>un", function() Snacks.notifier.hide() end,       desc = "Dismiss All Notifications" },
        { "<leader>bd",      function() Snacks.bufdelete() end,           desc = "Delete Buffer" },

        -- Grep
        { "<leader>sl",      function() Snacks.picker.lines() end,        desc = "[Grep] Buffer Lines" },
        { "<leader>sb",      function() Snacks.picker.grep_buffers() end, desc = "[Grep] Open Buffers" },
        { "<leader>sg",      function() Snacks.picker.grep() end,         desc = "[Grep]" },
        { "<leader>sv",      function() Snacks.picker.grep_word() end,    desc = "[Grep] Visual selection or word", mode = { "n", "x" } },

        -- Explorer
        { "<leader>ne",      function() Snacks.explorer() end,            desc = "File Explorer" },

        -- Buffers
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
