return {
    "jake-stewart/multicursor.nvim",
    event = "VeryLazy",
    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()

        vim.keymap.set({ "n", "x" }, "<localleader>j", function() mc.lineAddCursor(-1) end)
        vim.keymap.set({ "n", "x" }, "<localleader>k", function() mc.lineAddCursor(1) end)
        vim.keymap.set({ "n", "x" }, "<c-n>", function() mc.matchAddCursor(1) end)
        vim.keymap.set({ "n", "x" }, "<c-q>", mc.clearCursors)
    end
}
