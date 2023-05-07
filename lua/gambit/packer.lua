-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            -- Snippet Collection (Optional)
            {'rafamadriz/friendly-snippets'},
        }
    }
    -- NVIM TREE
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- GITSIGNS
    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    -- colorschemes
    use('rose-pine/neovim')
    -- use({
    --     'sainnhe/everforest',
    --     as = 'everforest',
    --     config = function()
    --         vim.cmd('colorscheme everforest')
    --     end
    -- })
    use('sainnhe/everforest')

    -- autopairs, auto closing pairs
    use('windwp/nvim-autopairs')

    -- bufferline (taps on top)
    -- use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
    -- require("bufferline").setup()

    -- status line below
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter-context')

    use {
        "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
        end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- display popup of key bindings
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup()
        end
    }

    -- surround selections
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup()
        end
    })

    -- a code outline window for skimming and quick navigation
    use {
        'stevearc/aerial.nvim',
        config = function()
            require('aerial').setup()
        end
    }

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    use('lervag/vimtex')

    -- DAP - Debug Adapter Protocol
    use('mfussenegger/nvim-dap')
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    -- better diagnostics
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
    }

    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    }

    use("lukas-reineke/indent-blankline.nvim")

    use("folke/zen-mode.nvim")

end)
