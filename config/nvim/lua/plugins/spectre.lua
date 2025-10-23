return {
    'nvim-pack/nvim-spectre',
    dependencies = {
        'folke/trouble.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local wk = require("which-key")
        wk.add({
            { "<localleader>S", group = "Spectre" },
        })

        require('spectre').setup()

        vim.keymap.set('n', '<localleader>Ss', '<cmd>lua require("spectre").toggle()<CR>', {
            noremap = true,
            silent = true,
            desc = '[Spectre] toggle'
        })

        vim.keymap.set('n', '<localleader>Sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
            noremap = true,
            silent = true,
            desc = '[Spectre] Search current word'
        })

        vim.keymap.set('v', '<localleader>Sv', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
            noremap = true,
            silent = true,
            desc = '[Spectre] Search current word'
        })

        vim.keymap.set('n', '<localleader>Sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
            noremap = true,
            silent = true,
            desc = '[Spectre] Search on current file'
        })
    end
}
