-- Read :h comment.config for more info.
local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  -- print("Comment not ok")
  return
end

-- this is the default config
comment.setup({
  padding = true,
  sticky = true,
  ignore = nil,
  toggler = { line = 'ga', block = 'gbc' },
  opleader = { line = 'gc', block = 'gb' },
  extra = { above = 'gcO', below = 'gco', eol = 'gcA' },
  mappings = { basic = true, extra = true },
  pre_hook = nil,
  post_hook = nil,
})
