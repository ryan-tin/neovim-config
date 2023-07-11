local wk = require("which-key")

vim.o.timeout = true
vim.o.timeoutlen = 500

wk.setup({
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    motions = {
        count = true,
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        -- margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
        -- padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
        winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
    show_help = true, -- show a help message in the command line for using WhichKey
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specifiy a list manually
    -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
    triggers_nowait = {
        -- marks
        "`",
        "'",
        "g`",
        "g'",
        -- registers
        '"',
        "<c-r>",
        -- spelling
        "z=",
    },
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for keymaps that start with a native binding
        i = { "j", "k" },
        v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by deafult for Telescope
    disable = {
        buftypes = {},
        filetypes = {},
    },
})

-- test
-- document and/or setup your own mappings
wk.register({
    ["<leader>"] = {
        A = "alpha",
        b = "buffers",
        c = {
            name = "cd",
            d = "cd",
            p = "planner",
        },
        d = {
            name = "debug",
            t = "toggle ui",
            R = "run to cursor",
            j = "up stacktrace",
            k = "down stacktrace",
            J = "go to line under cursor",
            c = "clear breakpoints",
            L = "?Log?",
            b = "toggle breakpoint",
            B = "list breakpoints",
            r = "repl open",
            l = "run last",
            i = "inspect (howver)",
            I = "inspect (window)",
            f = "frames",
            s = "scopes",
            x = "terminate"
        },
        D = "delete to void",
        e = "tree",
        f = {
            name = "fuzzy (telescope)",
            c = {
                name = "cd",
                c = "configs",
                v = "vault",
                u = "useful texts"
            },
            f = "find file",
            s = "search (grep static)",
            g = "grep (live)",
            p = "previous",
            h = "help",
            -- lsp
            d = "diagnostics",
            r = "references",
            i = "implementations",
            v = "variables/symbols",
            w = "workspaces",
            -- lsp
        },
        F = "format",
        g = {
            name = "git",
            b = "branches",
            c = "commits",
            d = "diff",
            f = "files",
            F = "file commits",
            h = "hunks",
            s = "status",
            S = "stash",
            t = {
                name = "toggle",
                b = "line blame",
                w = "word diff",
                d = "deleted"
            },
            H = "left diffget",
            L = "right diffget",
        },
        h = "remove highlight",
        i = "harpoon file",
        j = "loc list next",
        k = "loc list prev",
        l = {
            name = "lsp",
            a = "code action",
            d = "diagnostic",
            s = "symbols",
            r = "references",
            n = "rename",
            i = "implementations"
        },
        m = "markdown preview",
        p = "paste & delete to void",
        s = "rename",
        t = {
            name = "trouble",
            t = "toggle trouble",
            w = "workspace diagnostics",
            d = "document diagnostics",
            l = "loc list",
            q = "quickfix",
        },
        u = "undo Tree",
        w = "save",
        x = "close buffer",
        -- X = "close all other buffers",
        Y = "yank line to clipboard",
        y = "yank to clipboard",
        z = "zen mode"
    },
    ["g"] = {
        d = "function definition"
    },
    ["c"] = {
        name = "change",
        b = {
            name = "branch",
            ["<space>"] = "Populate command line with \":Git branch \"",
            ["<CR>"] = "Run :Git branch command",
            ["?"] = "help"
        },
        o = {
            name = "checkout",
            o = "check out commit under the cursor",
            ["<space>"] = "Populate command line with \":Git checkout \"",
            ["<CR>"] = "Run :Git checkout command",
            ["?"] = "help"
        }
    },
    ["["] = {
        b = "buffer",
        d = "diagnostic",
        t = "tab",
        h = "hunk"
    },
    ["]"] = {
        b = "buffer",
        d = "diagnostic",
        t = "tab",
        h = "hunk"
    },
})
