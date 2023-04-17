local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  "pyright", "tsserver", "angularls", "intelephense", "tsserver",
  "vimls", "html", "bashls", "eslint", "cssls", "jsonls", "dockerls"
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = { error = " ", warn = " ", hint = " ", info = " " }
})

lsp.setup()

-- show diagnostics at the end of line
vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = false, --{ spacing = 4, prefix = "" },
  severity_sort = true,
})

--vim.o.updatetime = 250
--vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
--vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.lsp.buf.hover()]]

require("mason").setup({
  ui = {
    width = 0.7,
    height = 0.5,
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
