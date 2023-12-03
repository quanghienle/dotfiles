require("nvim-autopairs").setup {}
require("nvim-ts-autotag").setup {}
require('mini.jump').setup()

require("copilot_cmp").setup()

require('comment-box').setup({
  box_width = 80,
})

require('telekasten').setup({
  home = vim.fn.expand("~/Documents/notes")
})

require("actions-preview").setup {
  backend = { "telescope", "nui" },
  telescope = {
    theme = "dropdown",
    initial_mode = "normal",
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "top",
      height = 0.5,
      width = 0.75,
      scroll_speed = 1
    }
  },
}


require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
  server_opts_overrides = {
    trace = "verbose",
    settings = {
      advanced = {
        listCount = 10,         -- #completions for panel
        inlineSuggestCount = 3, -- #completions for getCompletions
      }
    },
  }
})

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

--fix undefined vim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

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
local bordered_win = cmp.config.window.bordered({ winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,Search:None" })
local cmp_mappings = cmp.mapping.preset.insert({
  ["<C-d>"] = cmp.mapping.scroll_docs(1),
  ["<C-u>"] = cmp.mapping.scroll_docs(-1),
  ["<CR>"] = cmp.mapping.confirm({ select = true }),
});
cmp_mappings['<Tab>'] = vim.NIL
cmp_mappings['<S-Tab>'] = vim.NIL

-- Insert `(` after select function or method item
cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
cmp.setup {
  view = {
    entries = {
      name = 'custom',
      vertial_positioning = 'below', -- 'below' | 'above' | 'auto'
      selection_order = 'top_down'   -- 'top_down' | 'near_cursor
    }
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
      local kind = require("lspkind").cmp_format({
        mode = "symbol_text",
        maxwidth = 60,
        symbol_map = { Copilot = "" }
      })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end,
  },
  mapping = cmp_mappings,
  sources = {
    { name = "copilot" },
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
