require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false,        -- use a classic bottom cmdline for search
    command_palette = true,       -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true,        -- add a border to hover docs and signature help
  },
  views = {
    cmdline_popup = {
      position = { row = "35%", col = "50%" },
    },
  },
})

require("scrollbar").setup({
  handlers = { gitsigns = true },
  excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "NvimTree" },
})

require("dressing").setup({
  input = {
    prefer_width = 60,
    relative = "editor",
    title_pos = "center",
    win_options = { winblend = 0 },
  },
  select = {
    backend = { "nui" },
    nui = {
      min_height = 2,
      win_options = { winblend = 0 }
    }
  },
  builtin = {
    win_options = { winblend = 0 }
  },
})

require("gitsigns").setup {
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true
  },
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
    untracked = { text = "▎" }, -- █ or ▎
  }
}

require("colorizer").setup({
  filetypes = { "*", "!NvimTree", "!mason" },     -- exclude NvimTree
  user_default_options = { mode = "virtualtext" } -- foreground, background,  virtualtext
})

local excluded_filetypes = { "help", "Trouble", "NvimTree", "mason" }

require("indent_blankline").setup {
  char = "",
  filetype_exclude = excluded_filetypes,
  show_current_context = false,
  show_current_context_start = false,
}

require("mini.indentscope").setup({
  symbol = "│",
})



--function StatusColumn()
--  local buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
--  local signs = vim.tbl_map(
--    function(sign) return vim.fn.sign_getdefined(sign.name)[1] end,
--    vim.fn.sign_getplaced(buf, { group = "*", lnum = vim.v.lnum })[1].signs
--  )

--  local sign, git_sign
--  for _, s in ipairs(signs) do
--    if s.name:find("GitSign") then git_sign = s else sign = s end
--  end

--  local components = {
--    sign and ("%#" .. sign.texthl .. "#" .. sign.text .. "%*") or " ",
--    [[%=]],
--    [[%{&nu?(&rnu&&v:relnum?v:relnum:v:lnum):''} ]],
--    git_sign and ("%#" .. git_sign.texthl .. "#" .. git_sign.text .. "%*") or "  ",
--  }
--  return table.concat(components, "")
--end

--vim.opt.statuscolumn = [[%!v:lua.StatusColumn()]]
