local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file"      , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file"     , ":Telescope find_files cwd=./<CR>"),
    dashboard.button( "s", "  > Search"        , ":Telescope live_grep <CR>"),
    dashboard.button( "S", "  > Resume Session", ":SessionsLoad .session<CR>"),
    dashboard.button( "r", "  > Recent"        , ":Telescope oldfiles<CR>"),
    dashboard.button( "w", "?  > Workspaces"    , ":Telescope workspaces<CR>"),
    dashboard.button( "c", "  > Config"        , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "  > Quit"          , ":qa<CR>"),
}

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

vim.keymap.set("n", "<leader>A", ":Alpha<CR>", {silent = true})

-- Send config to alpha
alpha.setup(dashboard.opts)
