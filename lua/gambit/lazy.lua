local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- ESSENTIALS
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'ThePrimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                build = ":MasonUpdate"
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lua'},
            -- Snippets
            {'L3MON4D3/LuaSnip'},     -- Required
            {'saadparwaiz1/cmp_luasnip'},
            {'rafamadriz/friendly-snippets'},
        }
    },
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-context',
    {
        'nvim-tree/nvim-tree.lua',
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    },
    'nvim-tree/nvim-web-devicons', -- dependency for nvim-tree, trouble, and lualine
    'lewis6991/gitsigns.nvim',
    'windwp/nvim-autopairs',
    {
        "kylechui/nvim-surround", version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup() -- empty for defaults
        end
    },
    'natecraddock/workspaces.nvim',
    'natecraddock/sessions.nvim',
    -- ESSENTIALS END
    --
    -- USEFUL
    'lukas-reineke/indent-blankline.nvim',
    'mfussenegger/nvim-dap',
    "rcarriga/nvim-dap-ui",
    "folke/trouble.nvim",
    {
        'folke/todo-comments.nvim',
        opts = {
            keywords = {
                FIX = {
                    icon = "", -- icon used for the sign, and in search results
                    color = "error", -- can be a hex color, or a named color (see below)
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = { icon = "", color = "info" },
                HACK = { icon = "", color = "warning" },
                WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
                PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = "", color = "hint", alt = { "INFO" } },
                TEST = { icon = "", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
            },
        }
    },
    'numToStr/Comment.nvim',
    "folke/which-key.nvim",
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
    },
    { 'lervag/vimtex', ft = "latex" },
    -- USEFUL END
    --
    -- COSMETIC
    "folke/zen-mode.nvim",
    'goolord/alpha-nvim',
    'nvim-lualine/lualine.nvim',
    -- COSMETIC END
    --
    -- FUN
    'ThePrimeagen/vim-be-good', -- use command :VimBeGood to start
    -- FUN END
    --
    -- COLORSCHEMES
    'sainnhe/everforest',
    {
        'rebelot/kanagawa.nvim',
        lazy = false,
        priority = 1000
    },
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000
    },
    {
        'morhetz/gruvbox',
        lazy = false,
        priority = 1000
    },
    -- COLORSCHEMES END
}

local opts = {}

require("lazy").setup(plugins, opts)
