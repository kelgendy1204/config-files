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
                    { "<leader>g", group = "Gitsigns" },
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
                map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
                map('v', '<leader>gs', function()
                    gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end, { desc = 'Stage hunk' })

                map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Reset hunk' })
                map('v', '<leader>gr', function()
                    gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end, { desc = 'Reset hunk' })

                map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
                map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'Reset buffer' })
                map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
                map('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = 'Preview hunk inline' })

                map('n', '<leader>gb', function() gitsigns.blame_line({ full = true }) end, { desc = 'Blame line' })
                map('n', '<leader>gB', gitsigns.blame, { desc = 'Blame' })
                map('n', '<leader>gd', gitsigns.diffthis, { desc = 'Diff this' })

                ---@diagnostic disable-next-line: param-type-mismatch
                map('n', '<leader>gQ', function() gitsigns.setqflist('all') end, { desc = 'list all changes' })
                map('n', '<leader>gq', gitsigns.setqflist, { desc = 'list changes in file' })
            end,
        }
    end,
}
