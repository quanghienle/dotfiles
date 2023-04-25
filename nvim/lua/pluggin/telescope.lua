local actions = require("telescope.actions")

local layout_options = {
  prompt_position = "top",
  height = 0.5,
  width = 0.75,
  scroll_speed = 1
}

local function dropdown_horizontal(options)
  local conf = {
    theme = "dropdown",
    layout_strategy = "horizontal",
    layout_config = layout_options
  }
  for k, v in pairs(options or {}) do conf[k] = v end
  return conf
end

require("telescope").setup {
  defaults = {
    path_display = { "smart" },
    layout_strategy = "horizontal",
    layout_config = layout_options,
    prompt_prefix = "    ",
    selection_caret = "➤ ",
    color_devicons = true,
    scroll_strategy = "limit",
    dynamic_preview_title = true,
    sorting_strategy = "ascending",
    preview = { timeout = 1000 },
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
    builtin = dropdown_horizontal(),
    find_files = dropdown_horizontal(),
    live_grep = dropdown_horizontal(),
    grep_string = dropdown_horizontal(),
    marks = dropdown_horizontal(),
    buffers = {
      theme = "dropdown",
      initial_mode = "normal",
      previewer = false,
      path_display = function(opts, path)
        --local tail = require("telescope.utils").path_tail(path)
        --return string.format("%s [%s]", tail, path)
        return require("telescope.utils").path_tail(path)
      end,
    },
    help_tags = dropdown_horizontal(),
    lsp_references = dropdown_horizontal({
      show_line = false,
      initial_mode = "normal",
    }),
    diagnostics = dropdown_horizontal({
      initial_mode = "normal",
    }),
    spell_suggest = {
      theme = "dropdown",
      initial_mode = "normal",
    },
  },
}
