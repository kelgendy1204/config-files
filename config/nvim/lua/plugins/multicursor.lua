return {
    "jake-stewart/multicursor.nvim",
    event = "VeryLazy",
    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()

        vim.keymap.set({ "n", "x" }, "<leader><up>", function() mc.lineAddCursor(-1) end)
        vim.keymap.set({ "n", "x" }, "<leader><down>", function() mc.lineAddCursor(1) end)
        vim.keymap.set({ "n", "x" }, "<c-n>", function() mc.matchAddCursor(1) end)

        -- Mappings defined in a keymap layer only apply when there are
        -- multiple cursors. This lets you have overlapping mappings.
        mc.addKeymapLayer(function(layerSet)
            -- Enable and clear cursors using escape.
            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                else
                    mc.clearCursors()
                end
            end)
        end)
    end
}
