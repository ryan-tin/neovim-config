-- print("hello from lazy")
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
    { 'nvim-telescope/telescope.nvim', tag = '0.1.1', dependencies = { 'nvim-lua/plenary.nvim' } },
    'ThePrimeagen/harpoon',
    'ThePrimeagen/vim-be-good', -- use command :VimBeGood to start
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
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
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
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    },
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-context',
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    },
    'mfussenegger/nvim-dap',
    { "rcarriga/nvim-dap-ui", dependencies = "mfussenegger/nvim-dap" },
    { "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
    'lewis6991/gitsigns.nvim',
    'rose-pine/neovim',
    'sainnhe/everforest',
    'windwp/nvim-autopairs',
    { 'nvim-lualine/lualine.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
    { "akinsho/toggleterm.nvim", version = '*' },
    'numToStr/Comment.nvim',
    "folke/which-key.nvim",
    {
        "kylechui/nvim-surround", version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup() -- empty for defaults
        end
    },
    {
        'stevearc/aerial.nvim',
        event = "VeryLazy"
    },
    { "iamcco/markdown-preview.nvim", ft = "markdown" },
    { 'lervag/vimtex', ft = "latex" },
    { "SmiteshP/nvim-navic", dependencies = "neovim/nvim-lspconfig" },
    "lukas-reineke/indent-blankline.nvim",
    "folke/zen-mode.nvim",
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }
}

local opts = {}

require("lazy").setup(plugins, opts)
