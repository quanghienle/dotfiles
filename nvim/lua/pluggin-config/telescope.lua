local actions = require('telescope.actions')
local patterns_to_ignore = {
  "vendor/*", "%.lock", "__pycache__/*", "%.sqlite3", "%.ipynb", "node_modules/*", "%.jpg", "%.jpeg",
  "%.png", "%.svg", "%.otf", "%.ttf", ".git/", "%.webp", ".dart_tool/", ".github/", ".gradle/", ".idea/",
  ".settings/", ".vscode/", "__pycache__/", "build/", "env/", "gradle/", "node_modules/", "target/", "%.pdb",
  "%.dll", "%.class", "%.exe", "%.cache", "%.ico", "%.pdf", "%.dylib", "%.jar", "%.docx", "%.met",
  "smalljre_*/*", ".vale/", "%.burp", "%.mp4", "%.mkv", "%.rar", "%.zip", "%.7z", "%.tar", "%.bz2", "%.epub",
  "%.flac", "%.tar.gz",
}

require('telescope').setup {
  defaults = {
    path_display         = { 'smart', 'shorten' },
    layout_config        = {
      prompt_position = "bottom",
      height = 0.7,
      width = 0.7,
      scroll_speed = 1
    },
    file_sorter          = require('telescope.sorters').get_fzy_sorter,
    file_ignore_patterns = patterns_to_ignore,
    prompt_prefix        = ' 🔍   ',
    selection_caret      = '➤ ',
    color_devicons       = true,
    scroll_strategy      = "limit",
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
        ["J"] = actions.preview_scrolling_down,
        ["K"] = actions.preview_scrolling_up,
      }
    }
  },
  pickers = {
    lsp_references = {
      show_line = false,
      --initial_mode = "normal",
    },
    --diagnostics = {
    --  initial_mode = "normal",
    --},
    --grep_string = {
    --  initial_mode = "normal",
    --},
    --buffers = {
    --  initial_mode = "normal",
    --},
    --marks = {
    --  initial_mode = "normal",
    --}
  },
  extensions = {}
}
