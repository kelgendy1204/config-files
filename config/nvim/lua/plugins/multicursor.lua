return {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()

        vim.keymap.set({ "n", "x" }, "<localleader>j", function() mc.lineAddCursor(-1) end)
        vim.keymap.set({ "n", "x" }, "<localleader>k", function() mc.lineAddCursor(1) end)
        vim.keymap.set({ "n", "x" }, "<c-n>", function() mc.matchAddCursor(1) end)
        vim.keymap.set({ "n", "x" }, "<c-q>", mc.clearCursors)

        -- Mappings defined in a keymap layer only apply when there are
        -- multiple cursors. This lets you have overlapping mappings.
        mc.addKeymapLayer(function(layerSet)
            -- Enable and clear cursors using escape.
            layerSet("n", "<esc>", function()
                if mc.cursorsEnabled() then
                    mc.clearCursors()
                end
            end)
        end)
    end
}
