local actions = require('telescope.actions')

local layout_options = {
  prompt_position = "top",
  height = 0.5,
  width = 0.7,
  scroll_speed = 1
}

local function dropdown_horizontal(options)
  local conf = {
    theme           = "dropdown",
    layout_strategy = 'horizontal',
    layout_config   = layout_options
  }
  for k, v in pairs(options) do
    conf[k] = v
  end
  return conf
end

require('telescope').setup {
  defaults = {
    path_display = { 'smart' },
    layout_strategy = 'horizontal',
    layout_config = layout_options,
    prompt_prefix = '    ',
    selection_caret = '➤ ',
    color_devicons = true,
    scroll_strategy = "limit",
    sorting_strategy = "ascending",
    --dynamic_preview_title = true,
    preview = {
      timeout = 1000
    },
    mappings = {
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
    builtin = dropdown_horizontal({}),
    find_files = dropdown_horizontal({
      dynamic_preview_title = true
    }),
    live_grep = dropdown_horizontal({
      dynamic_preview_title = true
    }),
    grep_string = dropdown_horizontal({
      dynamic_preview_title = true,
      initial_mode = "normal"
    }),
    buffers = {
      theme = "dropdown",
      previewer = false,
      initial_mode = "normal"
    },
    marks = dropdown_horizontal({
      initial_mode = "normal"
    }),
    commands = {
      theme = "dropdown",
    },
    keymaps = {
      theme = "dropdown",
    },
    help_tags = dropdown_horizontal({}),
    lsp_references = dropdown_horizontal({
      show_line = false,
      initial_mode = "normal"
    }),
    diagnostics = dropdown_horizontal({
      initial_mode = "normal"
    }),
    spell_suggest = {
      theme = 'cursor',
      initial_mode = "normal"
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor({})
    }
  }
}

require("telescope").load_extension("ui-select")
