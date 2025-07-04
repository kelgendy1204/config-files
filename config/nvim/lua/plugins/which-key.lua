return {
    "folke/which-key.nvim",
    dependencies = {
        "echasnovski/mini.nvim",
        "nvim-web-devicons",
    },
    event = "VeryLazy",
    opts = {},
    keys = {
        {
            "<localleader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
