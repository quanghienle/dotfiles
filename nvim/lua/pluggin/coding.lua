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
  sign_icons = require("core.utils").signs_lower
})
lsp.setup()

vim.diagnostic.config({ virtual_text = false, underline = false }) -- show diagnostics at the end of line
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
local bordered_win = cmp.config.window.bordered({
  winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,Search:None"
})
-- Insert `(` after select function or method item
cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
cmp.setup {
  view = {
    entries = { name = 'custom', selection_order = 'near_cursor' }
  },
  window = {
    completion = bordered_win,
    documentation = bordered_win
  },
  snippet = {
    expand = function(args) require("luasnip").lsp_expand(args.body) end,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = nil,
    ['<S-Tab>'] = nil,
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
