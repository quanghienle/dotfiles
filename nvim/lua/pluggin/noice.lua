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
      position = {
        row = "40%",
        col = "50%",
      },
    },
  },
})
require('dressing').setup({
  input = {
    relative = "editor",
    win_options = {
      winblend = 0
    },
  },
  select = {
    backend = { "nui" },
    nui = {
      min_height = 2,
      win_options = {
        winblend = 0
      }
    },
    get_config = function(opts)
      if opts and opts.custom then
        return opts.custom
      end
    end
  },
  builtin = {
    win_options = {
      winblend = 0
    }
  },
})
