require("nvim-autopairs").setup {}
require("nvim-ts-autotag").setup {}

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

vim.diagnostic.config({ virtual_text = false }) -- show diagnostics at the end of line
--vim.o.updatetime = 250
--vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
--vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.lsp.buf.hover()]]

require("mason").setup({
  ui = {
    width = 0.7,
    height = 0.5,
    border = "rounded",
    icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" }
  }
})


require("nvim-treesitter.configs").setup({
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false,     -- install languages synchronously (only applied to `ensure_installed`)
  highlight = { enable = true },
  indent = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true -- highlight non-bracket tags like html tags
  },
})

-- nvim-cmp setup
local cmp = require("cmp")

local cmp_autopairs = require("nvim-autopairs.completion.cmp") -- Insert `(` after select function or method item
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
cmp.setup {
  window = {
    completion = { border = "rounded" },
    documentation = { border = "rounded" }
  },
  snippet = {
    expand = function(args) require("luasnip").lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(1),
    ["<C-u>"] = cmp.mapping.scroll_docs(-1),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = 'nvim_lsp_signature_help' },
    { name = "luasnip" },
    { name = "path" },
    { name = "calc" }
  },
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = "buffer" } }
})

-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    { name = "cmdline" }
  })
})
