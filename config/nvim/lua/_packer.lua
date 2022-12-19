-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
    -- Package manager self manage
    use 'wbthomason/packer.nvim'

    -- syntax for files
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Which key for list key mapping with leader key
    use "folke/which-key.nvim"

    -- Tabs
    use {
        'romgrk/barbar.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        }
    }

    -- Bottom line status
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Themes
    use 'morhetz/gruvbox'

    -- Indent lines
    use 'lukas-reineke/indent-blankline.nvim'

    -- File explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        }
    }

    -- For comments
    use 'b3nj5m1n/kommentary'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Surround code with anything
    use 'tpope/vim-surround'

    -- For git signs and its dependencies
    use 'lewis6991/gitsigns.nvim'

    -- For git integration
    use 'tpope/vim-fugitive'

    -- Fuzzy search for color schemes
    use 'flazz/vim-colorschemes'

    -- Pair brackets
    use 'jiangmiao/auto-pairs'

    -- Float terminal
    use 'voldikss/vim-floaterm'

    -- Editor config plugin
    use 'editorconfig/editorconfig-vim'

    -- Markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })

    -- A plugin to color colornames and codes
    use 'chrisbra/Colorizer'

    -- Make terminal vim and tmux work better together for focusing events
    use 'tmux-plugins/vim-tmux-focus-events'

    -- Git commits history for lines
    use 'rhysd/git-messenger.vim'

    -- Gitk for vim
    use 'cohama/agit.vim'

    -- Better searching
    use 'mhinz/vim-grepper'

    -- Auto closing tags
    use 'alvan/vim-closetag'

    -- Formatter plugin
    use 'mhartington/formatter.nvim'

    -- For project global search
    -- TODO look for alternatives
    -- TODO check if to be replaced
    use 'mileszs/ack.vim'

    -- For multicursors
    use 'terryma/vim-multiple-cursors'

    -- Setup lsp
    -- Setup the requested lsp servers
    use 'neovim/nvim-lspconfig'

    -- For buffers handling, extracting them to tabs, name the tabs and moving them
    use 'vim-ctrlspace/vim-ctrlspace'

    -- Support signature for nvim-compe until it's implemented
    use 'ray-x/lsp_signature.nvim'

    -- Lsp Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- For vsnip users.
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
end)
