local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
  -- "                                                     ",
  -- "                                                     ",
  -- "                                                     ",
  -- "                                                     ",
  -- "                                                     ",
  -- "                                                     ",
  "                                                     ",
  "                                                     ",
  -- "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  -- "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  -- "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  -- "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  -- "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  -- "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  -- "                                                     ",
  "            ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
  "             ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
  "                   ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
  "                    ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
  "                   ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀  ",
  "            ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
  "           ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
  "          ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
  "          ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
  "               ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
  "                ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
}

-- Set menu
dashboard.section.buttons.val = {
  dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "󰈞  > Find file", ":Telescope find_files<CR>"),
  dashboard.button("r", "  > Recent", function ()require('telescope.builtin').oldfiles({only_cwd=true}) end),
  dashboard.button("s", "  > Search", ":Telescope live_grep<CR>"),
  dashboard.button("c", "  > Config", ":e $MYVIMRC | :cd %:p:h<cr>"),
  dashboard.button("q", "󰅚  > Quit", ":qa<CR>"),
}

local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune({
  fortune_list = {
    -- { "", "A smooth sea never made a skillful sailor", "", "-Franklin D. Roosevelt" },
    { "", "For the advancement of the human race.",                                                                "", "-Me" },
    { "", "Comparison is the thief of joy.",                                                                       "", "-Unknown" },
    { "", "A man with a WHY can bear any HOW.",                                                                    "", "-Unknown" },
    { "", "Give me a place to stand, and a lever long enough, and I will move the world.",                         "", "-Archimedes" },
    { "", "The sun doesn't ask the world if it can rise",                                                          "", "-Reasons, Project 46" },
    { "", "I'm not in this world to live up to your expectations and you're not in this world to live up to mine", "", "-Bruce Lee" },
    { "", "The greatest of all weaknesses is the fear of appearing weak",                                          "", "- J.B. Bossuet, Politics from Holy Writ, 1709" },
    { "", "You cannot swim for new horizons until you have courage to lose sight of the shore.",                   "", "- William Faulkner" },
  },
})

-- Send config to alpha
alpha.setup(dashboard.opts)
