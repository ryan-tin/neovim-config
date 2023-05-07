local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end

vim.keymap.set({"i", "s" }, "<Tab>", "<cmd>lua require'luasnip'.jump(1)<CR>")
vim.keymap.set({"i", "s" }, "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>")

local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

luasnip.add_snippets("markdown", {
    -- custom cpp code snippet for markdown
    s("cpp", {
        t({ "```cpp", "" }), i(1, "code"), t({ "", "```" })
    })
})

-- read more about how to create custom snippets here
-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md
