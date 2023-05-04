-- THIS IS RECOMMENDED FROM LSP ZERO --
-- preset LSP, everything set up

-- local lsp = require('lsp-zero')
-- lsp.preset('recommended')
-- 
-- lsp.setup()

-- THIS IS PRIMEAGEN's CONFIG BELOW --
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver', -- typescript
  'eslint', -- javascript
  'lua_ls', -- lua
  --'rust_analyzer', -- rust
  'jdtls', -- java
  'pyright', -- python
  'clangd' -- C and C++
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp.setup({
    experimental = {
        ghost_text = true
    }
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- TODO this is stopping it from working in javascript?
  --if client.name == "eslint" then
  --    vim.cmd.LspStop('eslint')
  --    return
  --end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>ls", vim.lsp.buf.workspace_symbol, opts) -- search for a symbol
  vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts) -- code actions are "quick fixes", whenver you see an error message with (fix available), use this command..
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opts) -- quickly rename a symbol
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts) -- help with function signature, in insert mode.
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
