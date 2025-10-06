---@diagnostic disable: undefined-global

local listFocus = { focus = 'list', preview = false }

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = true, animate = { enabled = false } },
        input = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000
        },
        picker = {
            sources = {
                explorer = {}
            }
        },
    },
    keys = {
        { "<localleader>bd", function() Snacks.bufdelete() end,                            desc = "Delete Buffer" },

        -- explorer
        { "<localleader>e",  function() Snacks.explorer() end,                             desc = "File Explorer" },

        -- cmd
        { "<localleader>:",  function() Snacks.picker.command_history() end,               desc = "Command History" },

        -- notifications
        { "<localleader>nu", function() Snacks.notifier.hide() end,                        desc = "Dismiss All Notifications" },
        { "<localleader>nl", function() Snacks.notifier.show_history() end,                desc = "Notification History" },

        -- search
        { "<localleader>pr", function() Snacks.picker.registers(listFocus) end,            desc = "Registers" },
        { "<localleader>pc", function() Snacks.picker.commands(listFocus) end,             desc = "Commands" },
        { "<localleader>pC", function() Snacks.picker.colorschemes(listFocus) end,         desc = "Colorschemes" },
        { "<localleader>pk", function() Snacks.picker.keymaps(listFocus) end,              desc = "Keymaps" },
        { "<localleader>ph", function() Snacks.picker.help(listFocus) end,                 desc = "Help Pages" },
        { "<localleader>pi", function() Snacks.picker.icons(listFocus) end,                desc = "Icons" },
        { "<localleader>pd", function() Snacks.picker.diagnostics_buffer(listFocus) end,   desc = "Buffer Diagnostics" },
        { "<localleader>pD", function() Snacks.picker.diagnostics(listFocus) end,          desc = "Diagnostics" },
        { "<localleader>pp", function() Snacks.picker(listFocus) end,                      desc = "Pickers" },

        -- find
        { "<localleader>fg", function() Snacks.picker.files() end,                         desc = "Find Files" },
        { "<localleader>fp", function() Snacks.picker.projects(listFocus) end,             desc = "Projects" },
        { "<localleader>fr", function() Snacks.picker.recent(listFocus) end,               desc = "Recent" },
        { "<c-space>",       function() Snacks.picker.buffers(listFocus) end,              desc = "Navigate Buffers" },

        -- grep
        { "<localleader>sg", function() Snacks.picker.git_grep() end,                      desc = "Git Grep" },
        { "<localleader>sG", function() Snacks.picker.grep() end,                          desc = "Folder Grep" },
        { "<localleader>sw", function() Snacks.picker.grep_word() end,                     desc = "Visual selection or word", mode = { "n", "x" } },

        -- git
        { "<c-p>",           function() Snacks.picker.git_files() end,                     desc = "Find Git Files" },
        { "<localleader>gs", function() Snacks.picker.git_status(listFocus) end,           desc = "Git Status" },
        { "<localleader>gS", function() Snacks.picker.git_stash(listFocus) end,            desc = "Git Stash" },
        { "<localleader>gd", function() Snacks.picker.git_diff(listFocus) end,             desc = "Git Diff (Hunks)" },
        { "<localleader>gB", function() Snacks.gitbrowse() end,                            desc = "Git Browse",               mode = { "n", "v" } },
        { "<localleader>gg", function() Snacks.lazygit() end,                              desc = "Lazygit" },

        --lsp
        { "grd",             function() Snacks.picker.lsp_definitions(listFocus) end,      desc = "Goto Definition" },
        { "grD",             function() Snacks.picker.lsp_declarations(listFocus) end,     desc = "Goto Declaration" },
        { "grr",             function() Snacks.picker.lsp_references(listFocus) end,       desc = "References" },
        { "gri",             function() Snacks.picker.lsp_implementations(listFocus) end,  desc = "Goto Implementation" },
        { "grt",             function() Snacks.picker.lsp_type_definitions(listFocus) end, desc = "Goto T[y]pe Definition" },
        { "grs",             function() Snacks.picker.lsp_symbols(listFocus) end,          desc = "LSP Symbols" },
    },
    init = function()
        local wk = require("which-key")
        wk.add({
            { "gr",             group = "LSP" },
            { "<localleader>g", group = "Git" },
            { "<localleader>s", group = "Grep" },
            { "<localleader>p", group = "Picker" },
            { "<localleader>n", group = "Notifications" },
            { "<localleader>f", group = "Files" },
        })
    end,
}
