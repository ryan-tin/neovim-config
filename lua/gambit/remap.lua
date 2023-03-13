vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move functionality to move selected text up and down lines.
-- it will automatically indent and deindent if its to be moved inside an if statement
-- can test with the following block
-- if true then
-- end
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- J takes the line below and appends to current line with a space
-- this one is the same but allows cursor to remain in the same place.
vim.keymap.set("n", "J", "mzJ`z")

-- half page jumps, but cursor stays in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search terms stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- these are for "good times on twitch" can ignore these
-- vim.keymap.set("n", "<leader>vwm", function()
--     require("vim-with-me").StartVimWithMe()
-- end)
-- vim.keymap.set("n", "<leader>svwm", function()
--     require("vim-with-me").StopVimWithMe()
-- end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
-- foo
-- bar
-- suppose you selected foo and yanked it, and then you selected bar and hit p.
-- normally this will replace foo with bar in the yanked data,
-- but using <leader>p will not do so. It will delete the highlighted word into the void register, and then paste it over
-- test it out! use p normally, then compare with leader p

-- next greatest remap ever : asbjornHaland
-- use <leader>y to yank contents into clipboard so that it can be pasted outside of vim.
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- deleting to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- jk to escape
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("i", "KJ", "<Esc>")
-- COLEMAK escape
-- vim.keymap.set("i", "en", "<Esc>")

-- what does this do?
-- Primeagan says never to use Q
vim.keymap.set("n", "Q", "<nop>")

-- not sure what this does, but it uses tmux
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- quick format page
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- using leader s will let us replace the word we are on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- makes script (Prime used bash script as the example in the video) into an executable
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- use <leader>e to toggle open nvimtree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", { silent = true })

-- buffers
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { silent = true })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>x", "<cmd>bd!<CR>", { silent = true })

-- movements
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("v", "H", "^")
vim.keymap.set("v", "L", "$")
-- vim.keymap.set("n", "<CR>", "G") -- useful for jumping using line numbers?

-- cd to directory of current file
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>")

-- no hilight
vim.keymap.set("n", "<leader><space>", ":noh<CR>", { silent = true })

-- git 
vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit<CR>", { silent = true })

-- save
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true })

-- toggle markdown preview
--vim.keymap.set("n", "<C-m>", ":MarkdownPreviewToggle<CR>", {silent = true})
