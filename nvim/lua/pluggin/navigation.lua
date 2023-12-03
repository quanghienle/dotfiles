local utils = require("core.utils")

require "nvim-tree".setup {
  view = {
    width = { min = 35, max = 45 },
    centralize_selection = true
  },
  renderer = {
    icons = {
      show = { git = false, file = false, folder = false },
      glyphs = {
        folder = {
          arrow_closed = "⏵",
          arrow_open = "⏷",
        }
      },
    },
    indent_markers = { enable = true, inline_arrows = true },
  },
  filters = { dotfiles = false, }, --"false" to show dot files
  git = { ignore = false, },       --"false" to show gitignore files
  trash = { cmd = "trash" },
  update_focused_file = { enable = true }
}

require("symbols-outline").setup({
  relative_width = false,
  width = 40,
})

require("bufferline").setup({
  options = {
    tab_size = 12,
    separator_style = "slope",
    indicator = { style = "none" },
    show_close_icon = false,
    show_buffer_close_icons = false,
    show_buffer_icons = false,
  },
})


local section_hl = { bg = "#2f4159", fg = "White", bold = true }
require("lualine").setup {
  options = { globalstatus = true, },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      {
        utils.list_lsp,
        separator = { right = "" },
        color = section_hl
      }
    },
    lualine_c = {
      {
        "filetype",
        icon_only = true,
        separator = "",
        padding = { left = 1, right = 0 }
      },
      "filename",
      "diagnostics",
      {
        utils.get_diagnostic_message,
        cond = utils.has_diagnostic,
        fmt = function(str)
          if string.len(str) > 100 then
            return string.sub(str, 0, 100) .. "…"
          end
          return str
        end,
        color = utils.get_diagnostic_hl,
        padding = { left = 2, right = 0 }
      },
    },
    lualine_x = {
      {
        require("noice").api.status.command.get,
        cond = require("noice").api.status.command.has,
        color = { fg = "CornFlowerBlue" },
      },
      {
        require("noice").api.status.mode.get,
        cond = function()
          return require("noice").api.status.mode.has() and
              string.sub(require("noice").api.status.mode.get(), 1, 2) ~= "--"
        end,
        color = { fg = "CornFlowerBlue" },
      },
      --"b:gitsigns_blame_line",
      "diff"
    },
    lualine_y = {
      { "branch", color = section_hl }
    },
    lualine_z = {
      {
        "location",
        separator = "",
        padding = {
          left = 0,
          right = 0
        }
      },
      { function() return "[" .. vim.api.nvim_buf_line_count(0) .. "]" end }
    }
  },
}

require("core.winbar").set_winbar()

require("zen-mode").setup({
  window = {
    backdrop = 0.80, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    width = 0.85,    -- width of the Zen window
    height = 1,   -- height of the Zen window
  },
})

require('numb').setup()

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
    b = { name = " [B]uffer" },
    c = { name = " [C]omment",
      b = { name = " [C]omment-[B]ox" },
    },
    f = { name = " [F]ind" },
    g = { name = " [G]oTo" },
    n = { name = " [N]otification" },
    a = { name = " [A]ction" },
    s = { name = " [S]how" },
    t = { name = " [T]ab" },
    w = { name = " [W]indow" },
    m = { name = " [M]arks" },
  },
  { prefix = "<leader>" }
)
