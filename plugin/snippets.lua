local ls = require("luasnip")
ls.config.setup()

-- look in these files (<ft>.lua) for snippets for that ft
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
