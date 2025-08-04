-- vim.opt.guicursor = "" --fat cursor
-- commenting this out brought the slim cursor back

-- hide command line when its not being used
-- vim.opt.cmdheight = 0;

-- line numbers and relative line numbers activated
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1 -- gutter width. small gutters
-- 80 width column to remind not have too much on one line, use "" to remove line
vim.opt.colorcolumn = "80"

-- n space indents
local shiftwidth = 2
vim.opt.tabstop = shiftwidth
vim.opt.softtabstop = shiftwidth
vim.opt.shiftwidth = shiftwidth
vim.opt.expandtab = true -- spaces will be used to fill the amount of whitespace of the tab.

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.showtabline = 1 -- show tabline when there is at least two tabs

-- line wrap
vim.opt.wrap = false
-- Enable break indent: line wraps will have the same indentation as the primary line
vim.opt.breakindent = true

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

-- ignore case in search patterns Vim
-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- highlight the current line
vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true

-- allow mouse
vim.opt.mouse = "a"

-- no EOL is written to the end of a file if it is missing
-- This fixes the problem that I had in the 550 group project
vim.opt.fixeol = false

-- operations that would normally fail like :q raises dialogue instead
vim.opt.confirm = true

-- remove EOB char, default is ~
vim.opt.fillchars = 'eob: '
-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- don't show mode in statusline, this info is already shown in lualine
vim.opt.showmode = false
-- vim.opt.winbar = "a"

-- resize to the minimum amount of folds to display.
vim.opt.foldcolumn = 'auto'
-- vim.opt.foldcolumn='1'
vim.opt.foldmethod = 'manual'

-- Control how splits should open by default
-- vertical splits defaults to right side
-- horizontal splits defaults to top
vim.opt.splitright = true
vim.opt.splitbelow = false

-- needed for gx plugin
vim.g.netrw_nogx = 1

vim.g.have_nerd_font = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

vim.o.timeout = true
vim.o.timeoutlen = 500 -- in milliseconds, default 1000

vim.o.laststatus = 3

vim.opt.wrapscan = false -- don't wrap search around the file when using n
