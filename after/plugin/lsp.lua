local lsp = require("lsp-zero")
local cmp = require('cmp')

lsp.preset("recommended")

-- lsp.ensure_installed({
--     'tsserver', -- typescript
--     'eslint', -- javascript
--     'lua_ls', -- lua
--     --'rust_analyzer', -- rust
--     'jdtls', -- java
--     'pyright', -- python
--     'clangd' -- C and C++
-- })
lsp.ensure_installed({})

-- set up lsp config
-- do i need to do this for every language? or does it set it up by default if not explicitly stated
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lsp.nvim_lua_ls()) -- (Optional) Configure lua language server for neovim

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
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>ls", vim.lsp.buf.workspace_symbol, opts)   -- search for a symbol
  vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)        -- code actions are "quick fixes", whenver you see an error message with (fix available), use this command..
  vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opts)   -- quickly rename a symbol
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)   -- help with function signature, in insert mode.
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- Enter / <C-y> to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
    -- move through cmp menu
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    -- disable completion with tab (helps with copilot setup?)
    ['<Tab>'] = nil,
    ['<S-Tab>'] = nil
  },
  experimental = {
    ghost_text = true
  }
})
