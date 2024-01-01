-- vim.opt.guicursor = "" --fat cursor
-- commenting this out brought the slim cursor back

-- line numbers and relative line numbers activated
vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 space indents
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- spaces will be used to fill the amount of whitespace of the tab.

vim.opt.smartindent = true
vim.opt.showtabline = 1 -- show tabline when there is at least two tabs 

-- no line wrap, true = line wrap, false = no line wrap
vim.opt.wrap = false

-- vim will not do backups
-- but undo tree will have access to long running undos, saved at the dir in line 23
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- incremental search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- good colors
vim.opt.termguicolors = true

-- never have less than 8 colomuns at the bottom or top
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- fast update time
vim.opt.updatetime = 50

-- 80 width column to remind not have too much on one line, use "" to remove line
vim.opt.colorcolumn = "80"

-- ignore case in search patterns Vim
vim.opt.ignorecase = true

-- highlight the current line
vim.opt.cursorline = true

-- allow mouse
vim.opt.mouse = "a"

-- no EOL is written to the end of a file if it is missing
-- This fixes the problem that I had in the 550 group project
vim.opt.fixeol = false

-- operations that would normally fail like :q raises dialogue instead
vim.opt.confirm = true

-- remove EOB char, default is ~
vim.opt.fillchars='eob: '

-- don't show --INSERT-- in statusline, this info is already shown in lualine
vim.opt.showmode = false
-- vim.opt.winbar = "a"

-- resize to the minimum amount of folds to display.
vim.opt.foldcolumn='auto'
-- vim.opt.foldcolumn='1'
vim.opt.foldmethod='manual'

-- for vertical splits, always split to the right hand side
vim.opt.splitright = true
