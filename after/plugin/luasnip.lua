-- local status_ok, luasnip = pcall(require, "luasnip")
-- if not status_ok then
--   return
-- end

vim.keymap.set({"i", "s"}, "<Tab>", "<cmd>lua require'luasnip'.jump(1)<CR>")
vim.keymap.set({"i", "s"}, "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>")
