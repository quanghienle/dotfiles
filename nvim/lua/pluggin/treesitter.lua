require('nvim-treesitter.configs').setup({
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false,     -- install languages synchronously (only applied to `ensure_installed`)
  highlight = {
    enable = true
  },

  indent = {
    enable = true
  },

  rainbow = {
    enable = true,
    extended_mode = true -- highlight non-bracket tags like html tags
  },
})
