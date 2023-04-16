local excluded_filetypes = {
  "help",
  "alpha",
  "dashboard",
  "neo-tree",
  "Trouble",
  "lazy",
  "NvimTree",
  "mason"
}

require("indent_blankline").setup {
  filetype_exclude = excluded_filetypes,
  show_current_context = false,
  show_current_context_start = false,
}

require('mini.indentscope').setup({
  symbol = "│",
  options = { try_as_border = true },
})

-- exclude filetypes for mini.indentscope
vim.api.nvim_create_autocmd("FileType", {
  pattern = excluded_filetypes,
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})
