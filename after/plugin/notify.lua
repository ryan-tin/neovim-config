local notify = require("notify")
vim.notify = notify

notify.setup({
    background_colour = "#000000",
    fps = 120,
    top_down = true,
    timeout = 2000,
    stages = "static", -- using other styles causes cursor flicker 
    level = 2
})
