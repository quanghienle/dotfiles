local actions = require('telescope.actions')
local lga_actions = require("telescope-live-grep-args.actions")

require('telescope').setup {
  defaults = {
    path_display         = { 'smart' },
    layout_strategy = 'horizontal',
    layout_config        = {
      prompt_position = "bottom",
      height = 0.5,
      width = 0.7,
      scroll_speed = 1
    },
    prompt_prefix        = '    ',
    selection_caret      = '➤ ',
    color_devicons       = true,
    scroll_strategy      = "limit",
    dynamic_preview_title = true,

    --initial_mode = "normal",
    preview              = {
      timeout = 1000
    },
    mappings             = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["J"] = actions.preview_scrolling_down,
        ["K"] = actions.preview_scrolling_up,
      }
    }
  },
  pickers = {
    lsp_references = {
      show_line = false,
    },
    diagnostics = {
      line_width = 1000
    }
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      mappings = {
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
        },
        n = {
          ["<C-k>"] = lga_actions.quote_prompt(),
        },
      },
    }
  }
}

require("telescope").load_extension("live_grep_args")
