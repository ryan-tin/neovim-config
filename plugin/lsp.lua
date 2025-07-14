local lsp = require("lsp-zero")
local cmp = require('cmp')
local cmp_nvim_lsp = require "cmp_nvim_lsp"

lsp.preset("recommended")

lsp.ensure_installed({
  'ts_ls',         -- typescript
  'eslint',        -- javascript
  'lua_ls',        -- lua
  'rust_analyzer', -- rust
  'jdtls',         -- java
  'pyright',       -- python
  'clangd',        -- C and C++
  'bashls',        -- bash
  'cssls',         -- css
  'marksman',      -- markdown
  'cmake',
  -- 'sqlls', -- this sucks.
})

-- set up lsp config for each language
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup(lsp.nvim_lua_ls()) -- Configure lua language server for neovim

-- see pyright docs for more info on these settings
lspconfig.pyright.setup({}) -- TEST: default settings
-- lspconfig.pyright.setup({
--   -- on_attach = on_attach,
--   settings = {
--     pyright = {
--       autoImportCompletion = true,
--     },
--     python = {
--       analysis = {
--         autoSearchPaths = true,
--         diagnosticMode = 'workspace', -- analyze/report errors for all files, can also be 'openFilesOnly'
--         useLibraryCodeForTypes = true,
--         jtypeCheckingMode = 'off'
--       }
--     }
--   }
-- })

lspconfig.marksman.setup({})


-- TEST: autocmd to only trigger this setup for c++ files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*.cxx, *.cpp, *.h, *hpp",
  callback = function()
    lspconfig.clangd.setup {
      init_options = {
        fallbackFlags = {
          '--std=c++23', -- need this to tell clangd what version of cpp
          '--offset-encoding=utf-16',
        }
        -- alternatively, set at the project level using compile_flags.txt or compile_commands.json in the project directory
      },
      IndentPPDirectives = "AfterHash"
    }
  end,
})

-- ... with a bare setup for c files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*.c",
  callback = function()
    lspconfig.clangd.setup {
      IndentPPDirectives = "AfterHash"
    }
  end,
})


lspconfig.cmake.setup({})
lspconfig.jsonls.setup({})
-- lspconfig.sqlls.setup({
--   -- capabilities = capabilities,
--   filetypes = { 'sql' },
--   root_dir = function(_)
--     return vim.loop.cwd()
--   end,
-- })

lspconfig.bashls.setup({}) -- TEST:

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }

local ls = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end,
  },
  completion = {
    autocomplete = true,
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = cmp.mapping.preset.insert({
    -- Enter / <C-y> to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    -- ['<C-j>'] = cmp.mapping.confirm({ select = true }),
    -- Ctrl+Space to trigger completion menu
    ['<C-e>'] = function() -- toggle completion menu with a single key
      if cmp.visible() then
        cmp.close()
      else
        cmp.complete()
      end
    end,
    -- move through cmp menu
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    -- scroll popup documentation
    -- HACK: disabled this because im using <C-f> and <C-b> to move -> and <- in insert mode
    -- TODO: find a new mapping for this!
    -- ['<C-f>'] = cmp.mapping.scroll_docs(1),
    -- ['<C-b>'] = cmp.mapping.scroll_docs(-1),
    -- Navigate between snippet placeholder, <C-f>/<C-b> also works
    ['<C-j>'] = cmp.mapping(function()
      if ls.expand_or_locally_jumpable() then
        ls.expand_or_jump()
      end
    end, { 'i', 's' }),
    ['<C-k>'] = cmp.mapping(function()
      if ls.locally_jumpable(-1) then
        ls.jump(-1)
      end
    end, { 'i', 's' }),
    -- disable completion with tab (helps with copilot setup)
    -- NOTE: not using copilot rn
    ["<Tab>"] = cmp.mapping(function(fallback)
      local copilot_keys = vim.fn["copilot#Accept"]("")
      if cmp.visible() then
        cmp.select_next_item()
      elseif copilot_keys ~= "" then
        vim.api.nvim_feedkeys(copilot_keys, "i", false)
      -- elseif luasnip.expandable() then // TEST: no luasnip in lsp file
      --   luasnip.expand()
      -- elseif luasnip.expand_or_jumpable() then
      --   luasnip.expand_or_jump()
      -- elseif check_backspace() then
      --   fallback()
      else
        fallback()
      end
    end, { "i", "s", }),
    -- ['<Tab>'] = vim.NIL,
    -- ['<S-Tab>'] = vim.NIL
  }),
  experimental = {
    -- ghost_text = true -- this conflicts with copilot
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
  }, {
    { name = 'buffer' }
  })
})

-- set up vim-dadbod
cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
  sources = {
    { name = "luasnip" },
    { name = "vim-dadbod-completion" }, --
    { name = "buffer" }                 -- get completion from the currently open buffer
  }
})

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- cmp.setup.filetype({ "cmake" }, {
--   sources = {
--     {
--       name = "buffer"
--     }
--   }
-- })
