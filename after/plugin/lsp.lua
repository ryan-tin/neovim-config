local lsp = require("lsp-zero")
local cmp = require('cmp')

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',      -- typescript
  'eslint',        -- javascript
  'lua_ls',        -- lua
  'rust_analyzer', -- rust
  'jdtls',         -- java
  'pyright',       -- python
  'clangd',        -- C and C++
  'bashls',        -- bash
  'cssls'          -- css
})

-- set up lsp config for each language
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup(lsp.nvim_lua_ls()) -- Configure lua language server for neovim

-- see pyright docs for more info on these settings
lspconfig.pyright.setup({
  -- on_attach = on_attach,
  settings = {
    pyright = {
      autoImportCompletion = true,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = 'workspace', -- analyze/report errors for all files, can also be 'openFilesOnly'
        useLibraryCodeForTypes = true,
        jtypeCheckingMode = 'off'
      }
    }
  }
}
)

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

local luasnip = require('luasnip')
luasnip.config.setup()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = { completeopt = 'menu,menuone,noinsert' },
  mapping = {
    -- Enter / <C-y> to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    -- ['<C-j>'] = cmp.mapping.confirm({ select = true }),
    -- Ctrl+Space to trigger completion menu
    ['<C-e>'] = cmp.mapping.complete(),
    -- move through cmp menu
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    -- Navigate between snippet placeholder
    ['<C-j>'] = cmp.mapping(function()
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { 'i', 's' }),
    ['<C-k>'] = cmp.mapping(function()
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { 'i', 's' }),
    -- disable completion with tab (helps with copilot setup)
    ['<Tab>'] = vim.NIL,
    ['<S-Tab>'] = vim.NIL
  },
  experimental = {
    ghost_text = true -- conflicts with copilot
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "otter" },
  }
})
