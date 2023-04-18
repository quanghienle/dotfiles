require "nvim-tree".setup {
  view = {
    width = { min = 35, max = 45 },
    centralize_selection = true
  },
  renderer = {
    icons = { show = { git = false } },
    indent_markers = { enable = true, inline_arrows = false },
  },
  trash = { cmd = "trash" },
  ui = {
    confirm = { remove = true, trash = true, },
  },
  update_focused_file = {
    enable = true
  }
}

require("symbols-outline").setup({})

require("bufferline").setup({
  options = {
    separator_style = "slope",
    numbers = "ordinal",
    show_close_icon = false,
    show_buffer_close_icons = false,
    show_buffer_icons = false,
    offsets = { { filetype = "NvimTree", text = "" } },
  },
})

require("lualine").setup({
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      "diagnostics",
      {
        "filetype",
        icon_only = true,
        separator = "",
        padding = { left = 1, right = 0 }
      },
      { "filename", path = 1 }
    },
    lualine_x = { "diff" },
    lualine_y = { "progress" },
    lualine_z = { "location" }
  }
})

require("toggleterm").setup {
  shading_factor = "1",
  start_in_insert = true,
  direction = "float", -- | "horizontal" | "window" | "float",
  float_opts = { border = "curved", width = 170, height = 30 },
  highlights = {
    Normal = { link = "Normal" },
    NormalFloat = { link = "NormalFoat" },
    FloatBorder = { link = "FloatBorder" },
  },
}

local wk = require("which-key")
vim.opt.timeoutlen = 200
wk.setup({
  plugins = {
    marks = false,      -- shows a list of your marks on " and `
    registers = false,  -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = { enabled = false }
  },
  layout = {
    height = { min = 4, max = 20 }, -- min and max height of the columns
    spacing = 10,                   -- spacing between columns
    align = "center",               -- align columns left, center or right
  },
  window = { border = "single" }
})

wk.register(
  {
    b = { name = " Buffer..." },
    c = { name = " Comment..." },
    f = { name = " Find..." },
    g = { name = " Go to..." },
    n = { name = " Notification..." },
    r = { name = " Re-...(reformat, rename...)" },
    s = { name = " Show..." },
    w = { name = " Window..." },
  },
  {
    prefix = "<leader>"
  }
)
