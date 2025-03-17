require("nvim-autopairs").setup {}
require("nvim-ts-autotag").setup {}
require('mini.jump').setup()
require('mini.files').setup({
  -- Close explorer after opening file with `l`
  mappings = {
    go_in = 'L',
    go_in_plus = 'l',
  },
  -- General options
  options = {
    -- Whether to delete permanently or move into module-specific trash
    -- Whether to use for editing directories
    use_as_default_explorer = false
  },
  -- Customization of explorer windows
  windows = {
    -- Maximum number of windows to show side by side
    max_number = math.huge,
    -- Whether to show preview of file/directory under cursor
    preview = true,
    -- Width of focused window
    width_focus = 50,
    -- Width of non-focused window
    width_nofocus = 25,
    -- Width of preview window
    width_preview = 80,
  },
})

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
  "pyright", "ts_ls", "angularls", "intelephense",
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
    { name = 'render-markdown' },
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

require("CopilotChat").setup {
  -- default window options
  window = {
    layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
    width = 0.4,         -- fractional width of parent, or absolute width in columns when > 1
    height = 1,          -- fractional height of parent, or absolute height in rows when > 1

    -- Options below only apply to floating windows
    relative = 'editor',      -- 'editor', 'win', 'cursor', 'mouse'
    border = 'single',        -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
    title = 'Copilot Chat',   -- title of chat window
    zindex = 1,               -- determines if window is on top or below other floating windows
  },
  highlight_selection = true, -- Highlight selection
  highlight_headers = false,
  mappings = {
    complete = {
      insert = '<C-n>',
    },
  }
}

require('render-markdown').setup({
  file_types = { 'markdown', 'copilot-chat' },
})
