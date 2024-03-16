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
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',
        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    }
  },
  {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  'mbbill/undotree',
  'tpope/vim-fugitive',
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        build = ":MasonUpdate"
      },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lua' },
      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
  { 'nvim-treesitter/nvim-treesitter', },
  { 'nvim-treesitter/playground', },
  { 'nvim-treesitter/nvim-treesitter-context', },
  { 'nvim-tree/nvim-web-devicons', },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  -- skill issue? Learn to type
  -- 'windwp/nvim-autopairs',
  { "kylechui/nvim-surround", version = "*",        opts = {} },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    "chrishrb/gx.nvim",
    event = { "BufEnter" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      handler_options = {
        search_engine = "duckduckgo",
      }
    },
  },
  { 'folke/trouble.nvim',     opts = { signs = {} } },
  { 'folke/which-key.nvim', },
  {
    'numToStr/Comment.nvim',
    opts = {
      toggler = { line = 'ga' } -- use ga to toggle comment line and use gb to toggle block
    }
  },
  {
    'stevearc/oil.nvim',
    opts = {
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
      delete_to_trash = true,
    }
  },
  { "folke/zen-mode.nvim",       opts = {} },
  { 'nvim-lualine/lualine.nvim', },

  -- COLORSCHEMES
  {
    'rebelot/kanagawa.nvim',
    opts = {
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- Transparent floating windows
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          -- Borderless, block like modern Telescope UI
          -- TelescopeTitle = { fg = theme.ui.special, bold = true },
          -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

          -- Dark completion (popup menu)
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none" -- Remove the background of LineNr, {Sign,Fold}Column and friends
            }
          }
        }
      }
    },
    init = function()
      vim.cmd.colorscheme('kanagawa-wave')
    end
  },
  -- { "folke/tokyonight.nvim", },
  -- {
  --   "sainnhe/gruvbox-material",
  --   lazy = false,
  --   priority = 1000,
  --   init = function()
  --     vim.g.background = 'dark'
  --     vim.g.gruvbox_material_background = 'hard'
  --     vim.g.gruvbox_material_better_performance = 1
  --     vim.g.gruvbox_material_transparent_background = 2
  --     vim.cmd.colorscheme('gruvbox-material')
  --   end
  -- },
  -- {
  --   "sainnhe/everforest",
  --   lazy = false,
  --   priority = 1000,
  --   init = function()
  --     vim.g.background = 'dark'
  --     vim.g.everforest_background = 'hard'
  --     vim.g.everforest_better_performance = 1
  --     vim.cmd.colorscheme('everforest') -- this must be last
  --   end
  -- },
  -- "github/copilot.vim", -- trial expired
  { 'jpalardy/vim-slime' },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false }
  },
  {
    "quarto-dev/quarto-nvim",
    dev = false,
    dependencies = {
      {
        "jmbuhr/otter.nvim", -- allows code completion and other lsp features inside embedded code
        dev = false,
        dependencies = {
          { "neovim/nvim-lspconfig" },
        },
        opts = {
          buffers = {
            -- if set to true, the filetype of the otterbuffers will be set.
            -- otherwise only the autocommand of lspconfig that attaches
            -- the language server will be executed without setting the filetype
            set_filetype = true,
          },
        },
      },
    },
  },
  {
    "nanozuki/tabby.nvim",
    config = function()
      require("tabby.tabline").use_preset("tab_only")
    end,
  },
  { "nvim-tree/nvim-tree.lua" },
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      'nvim-lua/plenary.nvim'
    }
  },
}

local opts = {}

require("lazy").setup(plugins, opts)
