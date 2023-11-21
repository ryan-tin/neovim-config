require("toggleterm").setup({
  -- size can be a number or function which is passed the current terminal
  -- size = 20 | function(term)
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = false, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  -- shade_terminals = true,
  -- shading_factor = '30', -- FIX: get shading the same as other windows
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  direction = 'horizontal', -- 'float' | 'vertical' | 'horizontal' | 'tab' | 
  close_on_exit = true, -- close the terminal window when the process exits
  -- Change the default shell. Can be a string or a function returning a string
  shell = vim.o.shell,
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
  },
  winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts) -- go into normal mode in term
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts) -- move windwos
end

-- if you only want these mappings for toggle term use term://toggleterm instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
