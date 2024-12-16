---@diagnostic disable: undefined-global
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Tabs
    use {
        'romgrk/barbar.nvim',
        requires = {
            'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        }
    }

    -- Bottom line status
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Which key for list key mapping with leader key
    use "folke/which-key.nvim"

    -- Icons plugin required by which-key
    use 'echasnovski/mini.nvim'

    -- linter
    use 'mfussenegger/nvim-lint'

    -- Themes
    use 'ellisonleao/gruvbox.nvim'
    use 'luisiacc/gruvbox-baby'
    use 'Mofiqul/vscode.nvim'

    use { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
    }

    use { -- Autocompletion
        'hrsh7th/nvim-cmp',
        requires = { 'hrsh7th/cmp-nvim-lsp' },
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Fuzzy Finder (files, lsp, etc)
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    -- Indent lines
    use 'lukas-reineke/indent-blankline.nvim'

    -- For git signs and its dependencies
    use 'lewis6991/gitsigns.nvim'

    -- For git integration
    use 'tpope/vim-fugitive'

    -- Surround code with anything
    use 'tpope/vim-surround'

    -- Pair brackets
    use {
        'windwp/nvim-autopairs',
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Float terminal
    use 'numToStr/FTerm.nvim'

    -- File explorer
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    -- "gc" to comment visual regions/lines
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })

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

    -- For multicursors
    use 'terryma/vim-multiple-cursors'

    -- Copilot
    use 'github/copilot.vim'

    if is_bootstrap then
        require('packer').sync()
    end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end
