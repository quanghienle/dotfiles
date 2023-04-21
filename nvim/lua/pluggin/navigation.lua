require "nvim-tree".setup {
  view = {
    width = { min = 35, max = 45 },
    centralize_selection = true
  },
  renderer = {
    icons = { show = { git = false } },
    indent_markers = { enable = true, inline_arrows = false },
  },
  filters = { dotfiles = false, }, --'false' to show dot files
  git = { ignore = false, },       --'false' to show gitignore files
  trash = { cmd = "trash" },
  ui = {
    confirm = { remove = true, trash = true, },
  },
  update_focused_file = {
    enable = true
  }
}

require("symbols-outline").setup({
  relative_width = false,
  width = 35,
})

require("bufferline").setup({
  options = {
    separator_style = "slope",
    --numbers = "ordinal",
    numbers = function(opts)
      return opts.raise(opts.ordinal)
    end,
    show_close_icon = false,
    show_buffer_close_icons = false,
    show_buffer_icons = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = false
      }
    },
  },
})

require("lualine").setup({
  options = { globalstatus = true, },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff" },
    lualine_c = { "diagnostics", { "filename", path = 1 } },
    lualine_x = {
      {
        require("noice").api.status.command.get,
        cond = require("noice").api.status.command.has,
      },
      {
        require("noice").api.status.mode.get,
        cond = require("noice").api.status.mode.has
      },
      require("core.utils").list_lsp,
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = { "location" }
  },
})


require("core.winbar").set_winbar()

require("zen-mode").setup({
  window = {
    backdrop = 0.80, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    width = 0.85,    -- width of the Zen window
    height = 0.9,    -- height of the Zen window
  },
})


local wk = require("which-key")
vim.opt.timeoutlen = 200
wk.setup({
  plugins = {
    marks = false,     -- shows a list of your marks on " and `
    registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
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
