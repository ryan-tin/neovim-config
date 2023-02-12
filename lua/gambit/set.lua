-- vim.opt.guicursor = "" --fat cursor
-- commenting this out brought the slim cursor back

-- line numbers and relative line numbers activated
vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 space indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- no line wrap
vim.opt.wrap = false

-- vim will not do backups
-- but undo tree will have access to long running undos, saved at the dir in line 23
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- good colors
vim.opt.termguicolors = true

-- never have less than 8 colomuns at the bottom or top
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- fast update time
vim.opt.updatetime = 50

-- 80 width column to remind not have too much on one line
vim.opt.colorcolumn = "80"
-- vim.opt.colorcolumn = "" -- uncomment this to remove line

-- highlight all matches on previous serach patterns
vim.opt.hlsearch = true

-- ignore case in search patterns Vim
vim.opt.ignorecase = true

-- highlight the current line
vim.opt.cursorline = true

-- allow mouse
vim.opt.mouse = "a"
