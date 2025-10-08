return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup {
            signs = {
                add = { text = "+" },
                change = { text = "┃" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
            },
            on_attach = function(bufnr)
                local wk = require("which-key")
                wk.add({
                    { "<localleader>h", group = "Gitsigns (Hunk)" },
                })

                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ ']c', bang = true })
                    else
                        ---@diagnostic disable-next-line: param-type-mismatch
                        gitsigns.nav_hunk('next')
                    end
                end)

                map('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ '[c', bang = true })
                    else
                        ---@diagnostic disable-next-line: param-type-mismatch
                        gitsigns.nav_hunk('prev')
                    end
                end)

                -- Actions
                map('n', '<localleader>hs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
                map('v', '<localleader>hs', function()
                    gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end, { desc = 'Stage hunk' })

                map('n', '<localleader>hr', gitsigns.reset_hunk, { desc = 'Reset hunk' })
                map('v', '<localleader>hr', function()
                    gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end, { desc = 'Reset hunk' })

                map('n', '<localleader>hS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
                map('n', '<localleader>hR', gitsigns.reset_buffer, { desc = 'Reset buffer' })
                map('n', '<localleader>hp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
                map('n', '<localleader>hi', gitsigns.preview_hunk_inline, { desc = 'Preview hunk inline' })

                map('n', '<localleader>hb', function() gitsigns.blame_line({ full = true }) end, { desc = 'Blame line' })
                map('n', '<localleader>hB', gitsigns.blame, { desc = 'Blame' })
                map('n', '<localleader>hd', gitsigns.diffthis, { desc = 'Diff this' })
            end,
        }
    end,
}
