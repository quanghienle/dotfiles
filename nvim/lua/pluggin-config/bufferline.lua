-- :help bufferline.nvim
-- :help bufferline-highlights
local green = "#0be80d"
require("bufferline").setup {
  options = {
    separator_style = "slope",
    numbers = "none",
    show_close_icon = false,
    show_buffer_close_icons = false,
    diagnostics = "nvim_lsp"
  },
  highlights = {
    --fill = {
    --  bg = normal_bg,
    --},
    buffer_selected = {
      fg = green,
    }
  }
}
