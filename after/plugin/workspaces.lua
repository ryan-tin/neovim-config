require("workspaces").setup({
    hooks = {
        -- save workspace session before changing workspace
        open_pre = function()
            require("sessions").save("./.session", {})
        end,
        -- load workspace session on selecting workspace
        open = function()
            require("sessions").load("./.session", {})
        end,
    }
})
