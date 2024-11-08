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
      { 'hrsh7th/cmp-cmdline' },
      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
  { 'nvim-treesitter/nvim-treesitter', },
  { 'nvim-treesitter/playground', }, -- NOTE: deprecated and built into neovim?
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
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    opts = {},
  },
  { "kylechui/nvim-surround", version = "*", opts = {} },
  {
    "chrishrb/gx.nvim",
    event = { "BufEnter" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      handler_options = {
        search_engine = "google",
      }
    },
  },
  { "mfussenegger/nvim-dap", },
  {
    "rcarriga/nvim-dap-ui",
    opts = {},
    dependencies = {
      "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"
    },
    event = "VeryLazy"
  }, -- is neotest needed?
  {
    'mfussenegger/nvim-dap-python',
    init = function( --[[  ]])
      require('dap-python').setup(vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python')
    end,
    -- default test runner is unittest. This can be changed see github repo
  },
  {
    "folke/neodev.nvim",
    -- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
    -- is recommended by dap ui
    opts = {
      library = { plugins = { "nvim-dap-ui" }, types = true },
    }
  },
  { 'folke/trouble.nvim',        opts = { signs = {} } },
  {
    'folke/which-key.nvim',
    dependencies = {
      "echasnovski/mini.icons",
      "nvim-tree/nvim-web-devicons",
    }
  },
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
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, ".")
        end,
      },
    }
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = 160,
      },
    }
  },
  { 'nvim-lualine/lualine.nvim', },
  -- "github/copilot.vim", -- trial expired
  -- { 'jpalardy/vim-slime' },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false }
  },
  {
    "nanozuki/tabby.nvim",
    config = function()
      require("tabby.tabline").use_preset("tab_only")
    end,
  },
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   event = "VeryLazy"
  -- },
  -- {
  --   "goolord/alpha-nvim",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --     'nvim-lua/plenary.nvim'
  --   }
  -- },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,                      -- Recommended
    opts = {
      modes = { "n", "no", "c", "i" }, -- Change these modes to what you need
      hybrid_modes = { "n", "i" },     -- Uses this feature on normal mode
      -- This is nice to have
      callbacks = {
        on_enable = function(_, win)
          vim.wo[win].conceallevel = 2;
          vim.wo[win].concealcursor = "c";
        end
      }
    }
  },
  -- SQL
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod',                     lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   opts = {
  --     scope = {
  --       enabled = false
  --     },
  --     exclude = {
  --       filetypes = { "markdown" }
  --     }
  --   },
  -- },
  -- COLORSCHEMES
  { 'rebelot/kanagawa.nvim', },
  {
    "EdenEast/nightfox.nvim",
    opts = {} -- setup must be called before loading
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- {
  --   "robitx/gp.nvim",
  --   config = function()
  --     local conf = {
  --       -- For customization, refer to Install > Configuration in the Documentation/Readme
  --     }
  --     require("gp").setup(conf)
  --
  --     -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
  --   end,
  -- },
  -- NOTE: cannot get this to work with termguicolors... its set...
  -- {
  --   "norcalli/nvim-colorizer.lua",
  --   opts = {}
  -- }
}

local opts = {}

require("lazy").setup(plugins, opts)
