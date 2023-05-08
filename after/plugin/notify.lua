local notify = require("notify")
vim.notify = notify

notify.setup({
    background_colour = "#000000",
    fps = 30,
    top_down = true,
    stages = "static", -- using other styles causes cursor flicker 
    -- render = "compact"
})
