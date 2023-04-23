local utils = require("core.utils")

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
  width = 40,
})

require("bufferline").setup({
  options = {
    modified_icon = '⟡',
    tab_size = 12,
    max_name_length = 15,
    separator_style = "slope",
    --separator_style = {
    --  utils.separator.left,
    --  utils.separator.right,
    --},
    --numbers = "ordinal",
    --numbers = function(opts)
    --  return opts.raise(opts.ordinal)
    --end,
    indicator = { style = 'none', },
    show_close_icon = false,
    show_buffer_close_icons = false,
    show_buffer_icons = false,
  },
})


local vim_icon = function() return "" end
local space = {
  function() return " " end,
  color = { bg = utils.color.none },
}
require('lualine').setup {
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      utils.customize_lualine_section({ "mode" }),
      utils.customize_lualine_section({ vim_icon }, "lighter_bg", "blue"),
      space,
      utils.customize_lualine_section({ "filetype", colored = false, icon_only = true }, "blue", "black"),
      utils.customize_lualine_section({ "filename" }, "lighter_bg", "blue"),
      space,
      utils.customize_lualine_section({ utils.get_lsp_name }, "green", "black"),
      utils.customize_lualine_section({ "diagnostics" }, "lighter_bg", "blue"),
      space,
      { utils.get_diagnostic_message, cond = utils.has_diagnostic, color = utils.get_diagnostic_hl },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        require("noice").api.status.mode.get,
        cond = require("noice").api.status.mode.has,
        color = { bg = utils.color.none, fg = utils.color.blue },
      },
      space,
      {
        require("noice").api.status.command.get,
        cond = require("noice").api.status.command.has,
        color = { bg = utils.color.none, fg = utils.color.blue },
      },
      space,
      utils.customize_lualine_section({ "diff" }, "lighter_bg", "none"),
      utils.customize_lualine_section({ "branch" }, "green", "black"),
      space,
      utils.customize_lualine_section({ "progress" }, "lighter_bg", "blue"),
      utils.customize_lualine_section({ "location" }, "blue", "black"),
    }
  },
}
vim.api.nvim_set_hl(0, "lualine_c_normal", { link = "Normal" })


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
    t = { name = " Tab..." },
    w = { name = " Window..." },
  },
  { prefix = "<leader>" }
)
