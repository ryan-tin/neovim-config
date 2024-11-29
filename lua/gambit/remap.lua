vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- return jump, but cursor stays in the middle
vim.keymap.set("n", "<C-o>", "<C-o>zz")

-- go to definition/declaration jump, but cursor stays in the middle
vim.keymap.set("n", "gd", "gdzz")
vim.keymap.set("n", "gD", "gDzz")

-- search terms stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace selected text and delete the highlighted word into the void register
vim.keymap.set("x", "<leader>pd", [["_dP]], { desc = "[P]aste [D]elete to void" })

-- Paste all messages into the current buffer
vim.keymap.set("n", "<leader>pm", ":put =execute('mes')<CR>", { silent = true, desc = "[P]aste [M]essages into buffer" })
-- TODO: shortcut to put last X lines in the current buffer
-- :{count}mes[sages]   Show the {count} most recent messages
-- :mes[sages] clear    Clear all messages
--

-- use <leader>y to yank contents into clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[Y]ank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "[Y]ank line to clipboard" })

-- deleting to void register
vim.keymap.set({ "n", "v" }, "<leader>D", [["_d]], { desc = "[D]elete to void" })

-- jk to escape
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("i", "KJ", "<Esc>")
vim.keymap.set("i", "Kj", "<Esc>")

-- <C-f> and <C-b> to move around in normal mode
vim.keymap.set('i', '<C-f>', '<Right>')
vim.keymap.set('i', '<C-b>', '<Left>')

-- what does this do?
-- Primeagan says never to use Q
vim.keymap.set("n", "Q", "<nop>")

-- NOTE: these should go in tmux conf
-- open a new split to the right in the same directory
-- vim.keymap.set("n", "<leader>ch", ":silent !tmux split-window -h<CR>", { desc = "[C]reate [H]orizontal Tmux Split" })
-- open a new split on top in the same directory
-- vim.keymap.set("n", "<leader>cv", ":silent !tmux split-window -vb<CR>", { desc = "[C]reate [V]ertical Tmux Split" })
-- open new vsplit and python interpreter
-- vim.keymap.set("n", "<leader>cp", ":vsplit term://python3<cr><C-W>h",
--   { silent = true, desc = "[C]reate [P]ython terminal" })
-- vim.keymap.set("n", "<leader>ci", ":vsplit term://ipython<cr><C-w>h",
--   { silent = true, desc = "[C]reate [I]Python terminal" })

-- quick fix navigation
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
-- TODO: loclist navigation
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- makes script (Prime used bash script as the example in the video) into an executable
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- open Oil nvim
vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "[O]il" })

-- buffers
vim.keymap.set("n", "[b", ":bprev<CR>", { silent = true, desc = "[B]uffer" })
vim.keymap.set("n", "]b", ":bnext<CR>", { silent = true, desc = "[B]uffer" })
vim.keymap.set("n", "<leader>x", "<cmd>x<CR>", { silent = true, desc = "E[X]it Buffer" })
vim.keymap.set("n", "<leader>X", ":windo bd<CR>", { silent = true, desc = "E[X]it Tab" }) -- delete all buffers in this tab

-- tabs
-- <C-PageUp> and <C-PageDown> also work to change tabs, gt and gT also work
vim.keymap.set("n", "[t", ":tabprevious<CR>", { silent = true, desc = "[T]ab" })
vim.keymap.set("n", "]t", ":tabnext<CR>", { silent = true, desc = "[T]ab" })
vim.keymap.set("n", "<c-w>p", ":tabprevious<CR>", { silent = true, desc = "[T]ab" })
vim.keymap.set("n", "<c-w>n", ":tabnext<CR>", { silent = true, desc = "[T]ab" })
vim.keymap.set("n", "<C-w>t", ":tabe<CR>", { silent = true, desc = "[T]ab" })
vim.keymap.set("n", "<C-w>1", ":tabn1<CR>", { silent = true, desc = "Tab 1" })
vim.keymap.set("n", "<C-w>2", ":tabn2<CR>", { silent = true, desc = "Tab 2" })
vim.keymap.set("n", "<C-w>3", ":tabn3<CR>", { silent = true, desc = "Tab 3" })
vim.keymap.set("n", "<C-w>4", ":tabn4<CR>", { silent = true, desc = "Tab 4" })
vim.keymap.set("n", "<C-w>5", ":tabn5<CR>", { silent = true, desc = "Tab 5" })

-- terminal
vim.keymap.set("n", "<C-w>E", ":vs | te<CR>a", { silent = true, desc = "T[E]rminal (right)" })
vim.keymap.set("n", "<C-w><C-E>", ":vs | te<CR>a", { silent = true, desc = "T[E]rminal (right)" })
vim.keymap.set("n", "<C-w>e", ":sv | te<CR>a", { silent = true, desc = "T[E]rminal (top)" })
vim.keymap.set("n", "<C-w><C-e>", ":sv | te<CR>a", { silent = true, desc = "T[E]rminal (top)" })

-- movements
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("v", "H", "^")
vim.keymap.set("v", "L", "$")
-- vim.keymap.set("n", "<CR>", "Gzz") -- useful for jumping using line numbers?

-- no highlight
vim.keymap.set("n", "<esc>", ":noh<CR>", { silent = true, desc = "[N]o [H]ighlight" })

-- Git remaps
vim.keymap.set("n", "<leader>gs", ":vertical rightbelow Git<CR>", { desc = "[G]it [S]tatus" });
-- This is useful for handling merge conflicts
-- then use <leader>gH or <leader>gL to get that side's diff
vim.keymap.set("n", "<leader>gD", ":Gvdiffsplit!<CR>", { silent = true, desc = "3-way [G]it [D]iffsplit" })
vim.keymap.set("n", "<leader>gH", "<cmd>diffget //2<CR>", { silent = true, desc = "left [G]it diffget" })
vim.keymap.set("n", "<leader>gL", "<cmd>diffget //3<CR>", { silent = true, desc = "right [G]it diffget" })
-- the normal single file diff split
vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit<CR><C-w>l", { silent = true, desc = "[G]it [D]iff" })
vim.keymap.set("n", "<leader>gg", ":diffget<CR>", { silent = true, desc = "[G]it Diff[G]et" })
-- send all git diffs to quickfix list
vim.keymap.set("n", "<leader>gq", "<cmd>Git difftool<CR>", { desc = "[G]it Diffs -> [Q]uickfix" });

vim.keymap.set("n", "<leader>gth", ":Gitsigns preview_hunk_inline<CR>", { silent = true, desc = "[G]it [T]oggle [H]unk" })
-- vim.keymap.set("n", "<leader>gf", ":Gitsigns preview_hunk<CR>", { silent = true })

-- Git Toggles
vim.keymap.set("n", "<leader>gtb", ":Gitsigns toggle_current_line_blame<CR>",
  { silent = true, desc = "[B]lame" })
vim.keymap.set("n", "<leader>gtw", ":Gitsigns toggle_word_diff<CR>",
  { silent = true, desc = "[W]ord Diff" })
vim.keymap.set("n", "<leader>gtd", ":Gitsigns toggle_deleted<CR>", { silent = true, desc = "[D]eleted" })

-- Git Telescopes Searches
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = "[F]iles" })
vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_commits, { desc = "[C]ommits" })
-- checkout action with <CR>, reset mixed <C-r>m, reset soft <C-r>s, and reset hard <C-r>h
vim.keymap.set('n', '<leader>gF', require('telescope.builtin').git_bcommits, { desc = "[F]ile Commits" })
vim.keymap.set('n', '<leader>gb', require('telescope.builtin').git_branches, { desc = "[B]ranches" })
-- Lists all branches with log preview, checkout action <cr>, track action <C-t>,
-- rebase action<C-r>, create action <C-a>, switch action <C-s>, delete action <C-d> and merge action <C-y>
vim.keymap.set('n', '<leader>gS', require('telescope.builtin').git_stash, { desc = "[S]tash" })

-- other telescope
vim.keymap.set('n', '<leader>sf', function() require('telescope.builtin').oldfiles({ only_cwd = true }) end,
  { desc = "Old [F]iles" })

vim.keymap.set("n", "gh", function() require('gitsigns').nav_hunk('next', { wrap = false }) end,
  { silent = true, desc = "[H]unk" })
vim.keymap.set("n", "gH", function() require('gitsigns').nav_hunk('prev', { wrap = false }) end,
  { silent = true, desc = "[H]unk" })

-- save
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true, desc = "[W]rite" })
vim.keymap.set("i", "kw", ":w<CR>", { silent = true, desc = "[W]rite" })

-- resize window using shift and arrow keys
vim.keymap.set("n", "<S-Up>", "<cmd>resize +2<CR>")
vim.keymap.set("n", "<S-Down>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize +2<CR>")

vim.keymap.set({ "n", "x" }, "gx", "<cmd>Browse<cr>", { silent = true, desc = "open with gx" })

-- General Telescope
vim.keymap.set('n', '<C-f>', function() require('telescope.builtin').find_files({ hidden = true }) end, {})
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = "[B]uffers" })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = "[H]elp" })
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').resume, { silent = true, desc = "[P]revious" })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]elect Telescope' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[K]eymaps' })
vim.keymap.set('n', '<leader>sg', function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") });
  end,
  { desc = "Static [G]rep)" })
vim.keymap.set('n', '<leader>sl', require('telescope.builtin').live_grep, { desc = "[L]ive Grep" })

vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  -- require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
  --   -- winblend = 1,
  --   previewer = true,
  -- }) -- dropdown picker
  require('telescope.builtin').current_buffer_fuzzy_find({}) -- the default picker
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sc', ":Telescope live_grep search_dirs={\"~/Vault/cs/cpp/\"}<cr>",
  { desc = "[C]pp notes", silent = true })

-- LSP

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local map = function(mode, keys, func, desc)
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
    end

    map('n', '<leader>h', "<cmd>ClangdSwitchSourceHeader<cr>", "Switch Source/[H]eader (C/C++)")
    map('n', '<C-w><C-h>', "<c-w>v<cmd>ClangdSwitchSourceHeader<cr>", "Split Switch Source/[H]eader (C/C++)")
    map('n', '<leader>sd', require('telescope.builtin').diagnostics, "[D]iagnostics")
    map('n', '<leader>si', require('telescope.builtin').lsp_implementations, "[I]mplementations")

    map('n', '<leader>sv', function()
        require('telescope.builtin').lsp_document_symbols({ symbol_witdh=100, show_line=true })
      end , "[V]ariables")

    map('n', '<leader>sV', require('telescope.builtin').lsp_dynamic_workspace_symbols, "Workspace [V]ariables")
    map('n', '<leader>sr', require('telescope.builtin').lsp_references, "[R]eferences")
    -- Jump to the type of the word under your cursor.
    --  Useful when you're not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    map('n', '<leader>st', require('telescope.builtin').lsp_type_definitions, '[T]ype')
    map("n", "gl", vim.diagnostic.open_float, "Show Diagostic Error Message")
    map("n", "gn", vim.diagnostic.goto_next, "[N]ext Diagnostic")
    map("n", "gp", vim.diagnostic.goto_prev, "[P]revious Diagnostic")
    -- Rename the variable under your cursor
    --  Most Language Servers support renaming across files, etc.
    map('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[N]ame')
    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    map('n', '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    -- Opens a popup that displays documentation about the word under your cursor
    --  See `:help K` for why this keymap

    -- format entire doc when in normal mode, or only format selection
    map({ "n", "v" }, "<leader>f", vim.lsp.buf.format, "[F]ormat")

    map('n', 'gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    map('n', '<C-w>d', function()
      vim.cmd('vsplit')
      require('telescope.builtin').lsp_definitions()
    end, "Split and Definition")

    -- NOTE: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header
    map('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
    map('n', ']d', vim.diagnostic.goto_next, '[D]iagnostic')
    map('n', '[d', vim.diagnostic.goto_prev, '[D]iagnostic')
    -- TEST:
    map('n', '<leader>nd', vim.diagnostic.goto_next, '[D]iagnostic')
    map('n', '<leader>Nd', vim.diagnostic.goto_prev, '[D]iagnostic')
    -- NOTE: on mac, can use <C-H> for backspace can get by without mapping backspace?
    map("i", "<C-h>", vim.lsp.buf.signature_help, "Signature [H]elp")

    -- Highlight references of the word under your cursor when your cursor
    -- rests there for a little while. See `:help CursorHold` for information
    -- about when this is executed
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      -- When you move your cursor, the highlights will be cleared (the second autocommand).
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

vim.keymap.set("n", "<leader>E", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle Tre[E]" })

-- Harpoon
vim.keymap.set("n", "<leader>i", function() require("harpoon"):list():add() end, { desc = "Harpoon F[I]le" })
vim.keymap.set("n", "<leader>e", function() require("harpoon").ui:toggle_quick_menu(require('harpoon'):list()) end,
  { desc = "Harpoon" })
vim.keymap.set("n", "<C-j>", function() require("harpoon"):list():select(1) end)
vim.keymap.set("n", "<C-k>", function() require("harpoon"):list():select(2) end)
vim.keymap.set("n", "<C-l>", function() require("harpoon"):list():select(3) end)
vim.keymap.set("n", "<C-h>", function() require("harpoon"):list():select(4) end)

-- Trouble
vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>",
  { silent = true, noremap = true, desc = "[T]rouble [T]oggle" })
-- TODO: how to toggle workspace diagnostics?

vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { silent = true, desc = "[Z]en mode" })
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndo tree" })
-- vim.keymap.set("n", "<leader>a", ":Alpha<CR>", { silent = true, desc = "[A]lpha" })

-- don't type :
-- FIX: conflicts with repeat last f jump
-- vim.keymap.set("n", ";", ":", { silent = true })

-- DAP
vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = "Continue" })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = "Step Over" })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = "Step Into" })
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = "Step Out" })
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, { desc = "[B]reakpoint Add" })
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint Condition: ')) end,
  { desc = "[C]onditional Breakpoint" })
vim.keymap.set('n', '<leader>dr', function() require('dapui').open({ reset = true, silent = true }) end,
  { desc = "[D]apUI [R]eset" })
vim.keymap.set('n', '<Leader>dt', function() require('dap').terminate() end, { desc = "[D]ap [T]erminate" })
vim.keymap.set('n', '<Leader>dm',
  function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
  { desc = "[D]ap Log Point [M]essage" })
vim.keymap.set('n', '<Leader>dR', function() require('dap').repl.open() end, { desc = "[D]ap [R]epl Open" })
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "[D]ap Run [L]ast" })
--DAPUI WIDGETS
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function() require('dap.ui.widgets').hover() end,
  { desc = "[D]ap Widget [H]over" })
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function() require('dap.ui.widgets').preview() end,
  { desc = "[D]ap Widget [P]review" })
vim.keymap.set('n', '<Leader>df',
  function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
  end, { desc = "[D]ap [W]idget [F]rames" })
vim.keymap.set('n', '<Leader>ds',
  function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
  end, { desc = "[D]ap [W]idget [S]copes" })


vim.keymap.set('n', '<leader>nm', ']m', { desc = "[N]ext [M]ethod Start" })
vim.keymap.set('n', '<leader>Nm', '[m', { desc = "Previous [M]ethod Start" })
vim.keymap.set('n', '<leader>nM', ']M', { desc = "[N]ext [M]ethod End" })
vim.keymap.set('n', '<leader>NM', '[M', { desc = "Previous [M]ethod End" })

-- DBUI
vim.keymap.set('n', '<leader>db', ':DBUIToggle<cr>', { desc = "[D][B]UI Toggle" })

-- vim.keymap.set('n', '<C-W>d', ':vs<cr>gd', { desc = "split and definition", silent = true })

-- QOL command mode
-- vim.keymap.set('n', ';', ':')          -- don't type : so often
-- this conflicts with jumping to next f or t
vim.keymap.set({ 'n', 'v' }, '<leader>;', 'q:') -- open search list


-- % for the relative path
-- %:p for the full path
-- %:t just filename
-- yank file name into unamed register which can be pasted with p
-- TODO: output message that path has been copied
vim.keymap.set('n', 'yf', ':let @" = expand("%")<CR>', { desc = "relative path" })
vim.keymap.set('n', 'yF', ':let @" = expand("%:p")<CR>', { desc = "full path" })
-- yank path to clipboard
vim.keymap.set('n', '<leader>yf', ':let @+ = expand("%")<CR>', { desc = "relative path clipboard" })
vim.keymap.set('n', '<leader>yF', ':let @+ = expand("%:p")<CR>', { desc = "full path clipboard" })

-- swap between kanagawa dragon and wave using the vim.o.background = dark|light option
local function swapcolorscheme()
  local set_dark_mode = function()
    vim.api.nvim_set_option("background", "dark")
  end
  local set_light_mode = function()
    vim.api.nvim_set_option("background", "light")
  end
  if vim.o.background == 'dark' then
    set_light_mode()
  else
    set_dark_mode()
  end
end

vim.keymap.set('n', '<leader>cc', require('telescope.builtin').colorscheme, { desc = "[C]olorscheme" })

-- surround utility (q for ")
vim.keymap.set('n', 'ciq', 'ci"');
vim.keymap.set('n', 'caq', 'ca"');
vim.keymap.set('n', 'yiq', 'yi"');
vim.keymap.set('n', 'yaq', 'ya"');
vim.keymap.set('n', 'viq', 'vi"');
vim.keymap.set('n', 'vaq', 'va"');
vim.keymap.set('n', 'daq', 'da"');
vim.keymap.set('n', 'diq', 'di"');

-- sessions
vim.keymap.set('n', '<leader>SS', ':mksession!<CR>', { desc = "[S]ave" }) -- ! to overwrite file if exists, file ommitted, "Session.vim" is used
vim.keymap.set('n', '<leader>SL', ':source Session.vim<CR>', { desc = "[L]oad Session" })
