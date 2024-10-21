---@diagnostic disable: undefined-global
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
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        -- Actions
        map({ 'n', 'v' }, '<localleader>hs', gs.stage_hunk, { desc = 'Stage Hunk' })
        map({ 'n', 'v' }, '<localleader>hr', gs.reset_hunk, { desc = 'Reset Hunk' })
        map('n', '<localleader>hS', gs.stage_buffer, { desc = 'Stage Buffer' })
        map('n', '<localleader>hu', gs.undo_stage_hunk, { desc = 'Undo Stage Hunk' })
        map('n', '<localleader>hR', gs.reset_buffer, { desc = 'Reset Buffer' })
        map('n', '<localleader>hp', gs.preview_hunk, { desc = 'Preview Hunk' })
        map('n', '<localleader>hb', gs.blame_line, { desc = 'Blame Line' })
        map('n', '<localleader>tb', gs.toggle_current_line_blame, { desc = 'Toggle Current Line Blame' })
        map('n', '<localleader>hd', gs.diffthis, { desc = 'Diff This' })
        map('n', '<localleader>hD', function() gs.diffthis('~') end, { desc = 'Diff This ~' })
        map('n', '<localleader>td', gs.toggle_deleted, { desc = 'Toggle Deleted' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}
