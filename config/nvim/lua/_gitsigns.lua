---@diagnostic disable: undefined-global
require('gitsigns').setup {
    signs = {
        add          = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
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
        map({ 'n', 'v' }, '<localleader>hs', gs.stage_hunk)
        map({ 'n', 'v' }, '<localleader>hr', gs.reset_hunk)
        map('n', '<localleader>hS', gs.stage_buffer)
        map('n', '<localleader>hu', gs.undo_stage_hunk)
        map('n', '<localleader>hR', gs.reset_buffer)
        map('n', '<localleader>hp', gs.preview_hunk)
        map('n', '<localleader>hb', gs.blame_line)
        map('n', '<localleader>tb', gs.toggle_current_line_blame)
        map('n', '<localleader>hd', gs.diffthis)
        map('n', '<localleader>hD', function() gs.diffthis('~') end)
        map('n', '<localleader>td', gs.toggle_deleted)

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')

        -- Which key mapping
        local wk = require("which-key")
        wk.register({
            ["<localleader>"] = {
                h = {
                    name = "+gitsigns",
                    s = { gs.stage_hunk, "Stage hunk" },
                    S = { gs.stage_buffer, "Stage buffer" },
                    r = { gs.reset_hunk, "Reset buffer" },
                    R = { gs.reset_buffer, "Reset buffer" },
                    u = { gs.undo_stage_hunk, "Undo stage hunk" },
                    p = { gs.preview_hunk, "Preview hunk" },
                    b = { gs.blame_line, "Blame line" },
                    d = { gs.diffthis, 'Diff' },
                    D = { function() gs.diffthis('~') end, 'Diff buffer' },
                },
                t = {
                    b = { gs.toggle_current_line_blame, "Toggle blame" },
                    d = { gs.toggle_deleted, "Toggle deleted" },
                },
            },
        })
    end
}
