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
    },
    keys = {
        { "<localleader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
        { "<leader>bd",      function() Snacks.bufdelete() end,     desc = "Delete Buffer" },
    },
}
