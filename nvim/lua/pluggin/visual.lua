require("noice").setup({
  lsp = { -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
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
      position = { row = "40%", col = "50%" },
    },
  },
})

require('dressing').setup({
  input = {
    relative = "editor",
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

require('gitsigns').setup {
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 500,
    ignore_whitespace = false,
  },
  signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
  }
}

require("colorizer").setup({
  user_default_options = {
    mode = "virtualtext" -- Available modes for `mode`: foreground, background,  virtualtext
  }
})

local excluded_filetypes = {
  "help", "alpha", "dashboard", "neo-tree",
  "Trouble", "lazy", "NvimTree", "mason"
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
