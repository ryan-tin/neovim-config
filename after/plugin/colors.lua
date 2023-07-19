function Everforest()
  vim.opt.background = "dark"
  vim.cmd("let g:everforest_background = 'hard'")
  vim.cmd("let g:everforest_better_performance = 1")
  vim.cmd("let g:everforest_transparent_background = 1")     -- 2 conflicts with lualine
  -- The contrast of line numbers, indent lines, etc.
  vim.cmd("let g:everforest_ui_contrast = 'low'")            -- accepts 'high' or 'low'
  vim.cmd("let g:everforest_diagnostic_virtual_text = 'colored'")
  vim.cmd.colorscheme("everforest")

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- don't forget to comment out that line in ~/.tmux.conf for everforest colors to load properly
-- Everforest()

function Kanagawa()
  vim.o.background = ""
  vim.cmd("colorscheme kanagawa-wave")
  -- vim.cmd("colorscheme kanagawa-dragon")
  -- vim.cmd("colorscheme kanagawa-lotus")
end

Kanagawa()

-- make telescope borderless
-- require("tokyonight").setup({
--   on_highlights = function(hl, c)
--     local prompt = "#2d3149"
--     hl.TelescopeNormal = {
--       bg = c.bg_dark,
--       fg = c.fg_dark,
--     }
--     hl.TelescopeBorder = {
--       bg = c.bg_dark,
--       fg = c.bg_dark,
--     }
--     hl.TelescopePromptNormal = {
--       bg = prompt,
--     }
--     hl.TelescopePromptBorder = {
--       bg = prompt,
--       fg = prompt,
--     }
--     hl.TelescopePromptTitle = {
--       bg = prompt,
--       fg = prompt,
--     }
--     hl.TelescopePreviewTitle = {
--       bg = c.bg_dark,
--       fg = c.bg_dark,
--     }
--     hl.TelescopeResultsTitle = {
--       bg = c.bg_dark,
--       fg = c.bg_dark,
--     }
--   end,
-- })
-- vim.cmd.colorscheme("tokyonight-storm")
-- vim.cmd.colorscheme("tokyonight-night")
-- vim.cmd.colorscheme("tokyonight-moon")

-- vim.cmd.colorscheme("gruvbox") -- FIXME some highlights dont work well (telescope, treesitter-context)
