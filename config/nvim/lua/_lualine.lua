require 'lualine'.setup {
    options = {
        icons_enabled = true,
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
        padding = 2, -- adds padding to the left and right of components
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            'branch',
            {
                'diff',
                colored = true, -- displays diff status in color if set to true
                -- all colors are in format #rrggbb
                color_added = nil, -- changes diff's added foreground color
                color_modified = nil, -- changes diff's modified foreground color
                color_removed = nil, -- changes diff's removed foreground color
                symbols = { added = '+', modified = '~', removed = '-' } -- changes diff symbols
            },
        },
        lualine_c = {
            { 'filename', path = 1 },
            {
                'diagnostics',
                -- table of diagnostic sources, available sources:
                -- nvim_lsp, coc, ale, vim_lsp
                sources = { "nvim_diagnostic" },
                -- displays diagnostics from defined severity
                sections = { 'error', 'warn', 'info', 'hint' },
                -- all colors are in format #rrggbb
                color_error = nil, -- changes diagnostic's error foreground color
                color_warn = nil, -- changes diagnostic's warn foreground color
                color_info = nil, -- Changes diagnostic's info foreground color
                color_hint = nil, -- Changes diagnostic's hint foreground color
                symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' }
            }
        },
        lualine_x = { 'encoding', { 'fileformat', icon = nil }, { 'filetype', colored = true } },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = { 'quickfix', 'neo-tree', 'mason', 'fzf' }
}
