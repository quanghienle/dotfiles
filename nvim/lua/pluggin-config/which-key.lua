local wk = require("which-key")

wk.setup({
  layout = {
    height = { min = 4, max = 20 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3,                    -- spacing between columns
    align = "center",                 -- align columns left, center or right
  },
})

wk.register(
  {
    c = { name = "Comment..." },
    d = { name = "Delete..." },
    f = { name = "Find..." },
    g = { name = "Go to..." },
    r = { name = "Re..." },
    s = { name = "Show..." },
  },
  {
    prefix = "<leader>"
  }
)
