---@diagnostic disable: undefined-global

local listFocus = { focus = 'list' }

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = true },
        git = { enabled = true },
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
        scope = { enabled = true },
        terminal = { enabled = true },
    },
    keys = {
        { "<leader>bd", function() Snacks.bufdelete() end,                                                desc = "Delete Buffer" },

        -- explorer
        { "<leader>e",  function() Snacks.explorer() end,                                                 desc = "File Explorer" },

        -- cmd
        { "<leader>:",  function() Snacks.picker.command_history() end,                                   desc = "Command History" },

        -- notifications
        { "<leader>nu", function() Snacks.notifier.hide() end,                                            desc = "Dismiss All Notifications" },
        { "<leader>nl", function() Snacks.notifier.show_history() end,                                    desc = "Notification History" },

        -- search
        { '<leader>sr', function() Snacks.picker.registers(listFocus) end,                                desc = "Registers" },
        { "<leader>sc", function() Snacks.picker.commands(listFocus) end,                                 desc = "Commands" },
        { "<leader>sC", function() Snacks.picker.colorschemes(listFocus) end,                             desc = "Colorschemes" },
        { "<leader>sk", function() Snacks.picker.keymaps(listFocus) end,                                  desc = "Keymaps" },
        { "<leader>sh", function() Snacks.picker.help(listFocus) end,                                     desc = "Help Pages" },
        { "<leader>si", function() Snacks.picker.icons(listFocus) end,                                    desc = "Icons" },
        { "<leader>sd", function() Snacks.picker.diagnostics_buffer(listFocus) end,                       desc = "Buffer Diagnostics" },
        { "<leader>sD", function() Snacks.picker.diagnostics(listFocus) end,                              desc = "Diagnostics" },
        { "<leader>sp", function() Snacks.picker(listFocus) end,                                          desc = "Pickers" },

        -- find
        { "<leader>fg", function() Snacks.picker.files() end,                                             desc = "Find Files" },
        { "<leader>fp", function() Snacks.picker.projects(listFocus) end,                                 desc = "Projects" },
        { "<leader>fr", function() Snacks.picker.recent(listFocus) end,                                   desc = "Recent" },
        { "<c-space>",  function() Snacks.picker.buffers({ focus = 'list', sort_lastused = false, }) end, desc = "Navigate Buffers" },

        -- grep
        { "<leader>sg", function() Snacks.picker.git_grep() end,                                          desc = "Grep" },
        { "<leader>sG", function() Snacks.picker.grep() end,                                              desc = "Grep" },
        { "<leader>sw", function() Snacks.picker.grep_word() end,                                         desc = "Visual selection or word", mode = { "n", "x" } },

        -- git
        { "<c-p>",      function() Snacks.picker.git_files() end,                                         desc = "Find Git Files" },
        { "<leader>gs", function() Snacks.picker.git_status(listFocus) end,                               desc = "Git Status" },
        { "<leader>gS", function() Snacks.picker.git_stash(listFocus) end,                                desc = "Git Stash" },
        { "<leader>gb", function() Snacks.git.blame_line() end,                                           desc = "Git blame" },
        { "<leader>gB", function() Snacks.gitbrowse() end,                                                desc = "Git Browse",               mode = { "n", "v" } },
        { "<leader>gd", function() Snacks.picker.git_diff(listFocus) end,                                 desc = "Git Diff (Hunks)" },
        { "<leader>gg", function() Snacks.lazygit() end,                                                  desc = "Lazygit" },

        --lsp
        { "grd",        function() Snacks.picker.lsp_definitions(listFocus) end,                          desc = "Goto Definition" },
        { "grD",        function() Snacks.picker.lsp_declarations(listFocus) end,                         desc = "Goto Declaration" },
        { "grr",        function() Snacks.picker.lsp_references(listFocus) end,                           nowait = true,                     desc = "References" },
        { "gri",        function() Snacks.picker.lsp_implementations(listFocus) end,                      desc = "Goto Implementation" },
        { "grt",        function() Snacks.picker.lsp_type_definitions(listFocus) end,                     desc = "Goto T[y]pe Definition" },
        { "grs",        function() Snacks.picker.lsp_symbols(listFocus) end,                              desc = "LSP Symbols" },

        -- terminal
        { "<c-t>",      function() Snacks.terminal() end,                                                 desc = "Toggle Terminal" },
    },
}
