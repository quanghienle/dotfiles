local wk = require("which-key")
vim.o.timeoutlen = 200
wk.setup({
  plugins = {
    marks = false,      -- shows a list of your marks on ' and `
    registers = false,  -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    }
  },
  layout = {
    height = { min = 4, max = 20 }, -- min and max height of the columns
    spacing = 10,                   -- spacing between columns
    align = "center",               -- align columns left, center or right
  },
  window = {
    border = "single",   -- none, single, double, shadow
    position = "bottom", -- bottom, top
    winblend = 0,       -- value between 0-100 0 for fully opaque and 100 for fully transparent
  },
})

wk.register(
  {
    b = { name = " Buffer..." },
    c = { name = " Comment..." },
    f = { name = " Find..." },
    g = { name = " Go to..." },
    n = { name = " Notification..." },
    r = { name = " Reformat, Rename, Reset..." },
    s = { name = " Show..." },
    w = { name = " Window..." },
  },
  {
    prefix = "<leader>"
  }
)
