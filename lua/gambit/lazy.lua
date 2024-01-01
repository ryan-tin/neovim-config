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
      { 'neovim/nvim-lspconfig' }, -- Required
      {                            -- Optional
        'williamboman/mason.nvim',
        build = ":MasonUpdate"
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },                  -- Required
      { 'hrsh7th/cmp-nvim-lsp' },              -- Required
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lua' },
      -- Snippets
      { 'L3MON4D3/LuaSnip' }, -- Required
      { 'saadparwaiz1/cmp_luasnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/playground',
  'nvim-treesitter/nvim-treesitter-context',
  'nvim-tree/nvim-web-devicons', -- dependency for nvim-tree, trouble, and lualine
  'lewis6991/gitsigns.nvim',
  'windwp/nvim-autopairs',
  {
    "kylechui/nvim-surround",
    version = "*",
    config = function()
      require("nvim-surround").setup() -- empty for defaults
    end
  },
  "github/copilot.vim",
  -- ESSENTIALS END
  --
  -- USEFUL
  'folke/trouble.nvim',
  'numToStr/Comment.nvim',
  'folke/which-key.nvim',
  'stevearc/oil.nvim',
  { 'akinsho/toggleterm.nvim', version = "*", config = true },
  -- USEFUL END
  --
  -- COSMETIC
  "folke/zen-mode.nvim",
  'goolord/alpha-nvim',
  'nvim-lualine/lualine.nvim',
  { 'rebelot/kanagawa.nvim',   lazy = false,  priority = 1000 },
  -- COSMETIC END
}

local opts = {}

require("lazy").setup(plugins, opts)
