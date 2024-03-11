local quarto = require('quarto')
quarto.setup {
  debug = false,
  closePreviewOnExit = true,
  lspFeatures = {
    enabled = true,
    chunks = "curly",
    languages = { "r", "python", "julia", "bash", "html" },
    diagnostics = {
      enabled = true,
      triggers = { "BufWritePost" },
    },
    completion = {
      enabled = true,
    },
  },
  codeRunner = {
    enabled = false,
    default_method = 'slime', -- 'molten' or 'slime'
    ft_runners = {},          -- filetype to runner, ie. `{ python = "molten" }`.
    -- Takes precedence over `default_method`
    never_run = { "yaml" },   -- filetypes which are never sent to a code runner
  },
  keymap = {
    -- set whole section or individual keys to `false` to disable
    hover = "K",
    definition = "gd",
    type_definition = "gD",
    rename = "<leader>ln",
    format = "<leader>f",
    references = "gr",
    document_symbols = "gS",
  }
}

local otter = require('otter')
otter.setup()

-- table of embedded languages to look for.
-- required (no default)
local languages = { 'python', 'lua' }

-- enable completion/diagnostics
-- defaults are true
local completion = true
local diagnostics = true
-- treesitter query to look for embedded languages
-- uses injections if nil or not set
local tsquery = nil

otter.activate(languages, completion, diagnostics, tsquery)
