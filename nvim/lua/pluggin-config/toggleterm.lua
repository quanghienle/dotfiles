require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-t>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'float',  -- | 'horizontal' | 'window' | 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell

  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    border = 'curved', -- single/double/shadow/curved
    highlights = {
      border = "TelescopeBorder",
      background = "Normal",
    }
  }
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
        border = "curved",
        highlights = {
            border = "TelescopeBorder",
            background = "Normal",
        }
    },
})

function _lazygit_toggle()
  lazygit:toggle()
end


vim.api.nvim_set_keymap( "n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap( "n", "<leader>tt", ":ToggleTerm<CR>", {noremap = true, silent = true})

