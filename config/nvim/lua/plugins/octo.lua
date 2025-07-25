-- Octo for GitHub integration
return {
    'pwntester/octo.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        -- OR 'ibhagwan/fzf-lua',
        -- OR 'folke/snacks.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    config = function ()
        require"octo".setup()
    end
}
