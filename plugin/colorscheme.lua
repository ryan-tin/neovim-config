require('kanagawa').setup({
  theme = "wave",      -- Load "wave" theme when 'background' option is not set
  background = {       -- map the value of 'background' option to a theme
    dark = "dragon",   -- try "dragon" !
    light = "wave"
  },
  transparent = true,
  overrides = function(colors)
    local theme = colors.theme
    return {
      -- Transparent floating windows
      NormalFloat = { bg = "none" },
      FloatBorder = { bg = "none" },
      -- FloatBorder = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
      FloatTitle = { bg = "none" },
      -- Save an hlgroup with dark background and dimmed foreground
      -- so that you can use it where your still want darker windows.
      -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
      NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
      -- Popular plugins that open floats will link to NormalFloat by default;
      -- set their background accordingly if you wish to keep them dark and borderless
      LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
      MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

      -- Borderless, block like modern Telescope UI
      TelescopeTitle = { fg = theme.ui.special, bold = true },
      TelescopePromptNormal = { bg = theme.ui.bg_p1 },
      TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
      TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
      TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
      TelescopePreviewNormal = { bg = theme.ui.bg_dim },
      TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

      -- Dark completion (popup menu)
      Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },   -- add `blend = vim.o.pumblend` to enable transparency
      PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
      PmenuSbar = { bg = theme.ui.bg_m1 },
      PmenuThumb = { bg = theme.ui.bg_p2 },
    }
  end,
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none"   -- Remove the background of LineNr, {Sign,Fold}Column and friends
        }
      }
    }
  }
})


vim.cmd.colorscheme('kanagawa-dragon')
-- vim.cmd.colorscheme('kanagawa-wave')
-- vim.cmd.colorscheme('nightfox')
-- vim.cmd.colorscheme('terafox')
-- vim.cmd.colorscheme('nordfox')
-- vim.cmd.colorscheme('tokyonight-night')
