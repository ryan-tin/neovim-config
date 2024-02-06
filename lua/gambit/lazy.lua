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
    tag = '0.1.4',
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
  -- ESSENTIALS END
  --
  -- USEFUL
  'folke/trouble.nvim',
  'numToStr/Comment.nvim',
  'folke/which-key.nvim',
  'stevearc/oil.nvim',
  -- USEFUL END

  -- COSMETIC
  {
    -- TODO: add which keywords to use here
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- :TodoQuickFix uses quickfist list to show all todos in the project
    -- :TodoLocList to show all Todos in the project
    -- :TodoTrouble to list all Todos in Trouble
    -- :TodoTelescope to search through all project todos with Telescope
  },
  "folke/zen-mode.nvim",
  'nvim-lualine/lualine.nvim',
  { 'rebelot/kanagawa.nvim', lazy = false, priority = 1000 },
  -- COSMETIC END

  -- EXPERIMENTAL
  -- "github/copilot.vim", -- trial expired
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
  },
  -- something with latex?
  { 'jpalardy/vim-slime' },
  -- EXPERIMENTAL END
}

local opts = {}

require("lazy").setup(plugins, opts)
