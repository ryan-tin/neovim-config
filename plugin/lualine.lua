local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = true,
  -- symbols = { added = " ", modified = " ", removed = " " },
  symbols = { added = "+", modified = "~", removed = "-" },
  cond = hide_in_width
}

local mode = {
  "mode",
  fmt = function(str)
    return string.sub(str, 0, 1) .. string.lower(string.sub(str, 2))
  end,
}

local filetype = {
  "filetype",
  icons_enabled = true,
  icon = nil,
}

local branch = {
  "branch",
  icon = "",
  icons_enabled = true,
}


local location = {
  "location",
  padding = 1,
}

local filename = {
  'filename',
  path = 1,
}

local progress = {
  'progress',
  -- padding = {
  --   left = 0,
  --   right = 1
  -- }
  padding = 1
}

-- local progress = function()
--   local current_line = vim.fn.line(".")
--   local total_lines = vim.fn.line("$")
--   local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
--   local line_ratio = current_line / total_lines
--   local index = math.ceil(line_ratio * #chars)
--   return chars[index]
-- end

local function selectionCount()
	local isVisualMode = vim.fn.mode():find("[Vv]")
	if not isVisualMode then return "" end
	local starts = vim.fn.line("v")
	local ends = vim.fn.line(".")
	local lines = starts <= ends and ends - starts + 1 or starts - ends + 1
	return "/ " .. tostring(lines) .. "L " .. tostring(vim.fn.wordcount().visual_chars) .. "C"
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { "dashboard", "Outline", "NvimTree" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch },
    lualine_c = { diff, filename },
    lualine_x = { 'searchcount', diagnostics },
    lualine_y = { filetype },
    lualine_z = { location, progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { filename },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = { "nvim-dap-ui" },
})
