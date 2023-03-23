local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup {
    open_mapping = [[<c-\>]], -- open terminal from normal mode
    autochdir = false,        -- when neovim changes it current directory the terminal will change it's own when next it's opened
    direction = 'float',      -- 'vertical' | 'horizontal' | 'tab' | 'float',
    -- This field is only relevant if direction is set to 'float'
}
