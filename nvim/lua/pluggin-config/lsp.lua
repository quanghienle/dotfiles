local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'pyright',
  'tsserver',
  'angularls',
  'intelephense',
  'tsserver',
  'vimls',
  'html',
  'bashls',
  'eslint',
  'cssls',
  'jsonls',
  'dockerls'
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = signs
})


lsp.setup()

-- show diagnostics at the end of line
vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "" },
  severity_sort = true,
})

--vim.o.updatetime = 250
--vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
--vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.lsp.buf.hover()]]

require("mason").setup({
  ui = {
    width = 0.7,
    height = 0.7,
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
