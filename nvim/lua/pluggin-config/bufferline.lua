-- :help bufferline.nvim
-- :help bufferline-highlights
require("bufferline").setup {
  options = {
    separator_style = "slope",
    numbers = "none",
    show_close_icon = false,
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_buffer_icons = false,
    diagnostics = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "",
        text_align = "left",
        separator = false
      }
    },
  },
}
