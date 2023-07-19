local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end

-- vim.keymap.set({"i", "s" }, "<Tab>", "<cmd>lua require'luasnip'.jump(1)<CR>")
-- vim.keymap.set({"i", "s" }, "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>")

local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

-- custom snippets
luasnip.add_snippets("markdown", {
  -- code blocks
  s("cpp", { t({ "```cpp", "" }), i(1, "code"), t({ "", "```" }) }),
  s("css", { t({ "```css", "" }), i(1, "code"), t({ "", "```" }) }),
  s("html", { t({ "```html", "" }), i(1, "code"), t({ "", "```" }) }),

  -- text formatting
  s("italics", { t("*"), i(1, "text"), t("*") }),
  s("bold", { t("**"), i(1, "text"), t("**") }),
  s("both", { t("***"), i(1, "text"), t("***") }),
})

-- read more about how to create custom snippets here
-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md

luasnip.add_snippets("cpp", {
  s("main", {
    t({ "int main(int argc, char* argv[]) {", "\t" }), i(1, "block"),
    t({ "", "}" })
  })
})
