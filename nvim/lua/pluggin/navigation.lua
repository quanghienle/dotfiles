local utils = require("core.utils")

require "nvim-tree".setup {
  view = {
    width = { min = 35, max = 45 },
    centralize_selection = true
  },
  renderer = {
    icons = {
      show = { git = false, file = false, folder = false },
      glyphs = {
        folder = {
          arrow_closed = "⏵",
          arrow_open = "⏷",
        }
      },
    },
    indent_markers = { enable = true, inline_arrows = true },
  },
  filters = { dotfiles = false, }, --"false" to show dot files
  git = { ignore = false, },       --"false" to show gitignore files
  trash = { cmd = "trash" },
  update_focused_file = { enable = false }
}

require("symbols-outline").setup({
  relative_width = false,
  width = 40,
})

require("bufferline").setup({
  options = {
    tab_size = 12,
    max_name_length = 20,
    separator_style = "thin", --slope, thin, thick, slant
    indicator = { style = "none" },
    show_close_icon = false,
    show_buffer_close_icons = false,
    show_buffer_icons = false
  },
})


local section_hl = { bg = "#2f4159", fg = "White", bold = true }
require("lualine").setup {
  options = { globalstatus = true, },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      {
        "branch",
        separator = { right = "" },
        color = section_hl
      }
    },
    lualine_c = {
      --{
      --  "filetype",
      --  icon_only = true,
      --  separator = "",
      --  padding = { left = 1, right = 0 }
      --},
      --"filename",
      "diff",
      --{
      --  utils.get_diagnostic_message,
      --  cond = utils.has_diagnostic,
      --  fmt = function(str)
      --    if string.len(str) > 100 then
      --      return string.sub(str, 0, 100) .. "…"
      --    end
      --    return str
      --  end,
      --  color = utils.get_diagnostic_hl,
      --  padding = { left = 2, right = 0 }
      --},
      "b:gitsigns_blame_line",
    },
    lualine_x = {
      {
        require("noice").api.status.command.get,
        cond = require("noice").api.status.command.has,
        color = { fg = "CornFlowerBlue" },
      },
      {
        require("noice").api.status.mode.get,
        cond = function()
          return require("noice").api.status.mode.has() and
              string.sub(require("noice").api.status.mode.get(), 1, 2) ~= "--"
        end,
        color = { fg = "CornFlowerBlue" },
      },
      "diagnostics",
      --"b:gitsigns_blame_line",
    },
    lualine_y = {
      { utils.list_lsp, color = section_hl }
    },
    lualine_z = {
      {
        "location",
        separator = "",
        padding = {
          left = 0,
          right = 0
        }
      },
      { function() return "[" .. vim.api.nvim_buf_line_count(0) .. "]" end }
    }
  },
}

require("core.winbar").set_winbar()

require("zen-mode").setup({
  window = {
    backdrop = 0.80, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    width = 0.85,    -- width of the Zen window
    height = 1,      -- height of the Zen window
  },
})

require('numb').setup()

require("auto-session").setup {
  enabled = true,                     -- Enables/disables auto creating, saving and restoring
  auto_save = true,                   -- Enables/disables auto saving session on exit
  auto_restore = true,                -- Enables/disables auto restoring session on start
  auto_create = true,                 -- Enables/disables auto creating new session files. Can take a function that should return true/false if a new session file should be created or not
  suppressed_dirs = nil,              -- Suppress session restore/create in certain directories
  allowed_dirs = nil,                 -- Allow session restore/create in certain directories
  auto_restore_last_session = false,  -- On startup, loads the last saved session if session for cwd does not exist
  use_git_branch = false,             -- Include git branch name in session name
  lazy_support = true,                -- Automatically detect if Lazy.nvim is being used and wait until Lazy is done to make sure session is restored correctly. Does nothing if Lazy isn't being used. Can be disabled if a problem is suspected or for debugging
  bypass_save_filetypes = nil,        -- List of filetypes to bypass auto save when the only buffer open is one of the file types listed, useful to ignore dashboards
  close_unsupported_windows = true,   -- Close windows that aren't backed by normal file before autosaving a session
  args_allow_single_directory = true, -- Follow normal sesion save/load logic if launched with a single directory as the only argument
  args_allow_files_auto_save = false, -- Allow saving a session even when launched with a file argument (or multiple files/dirs). It does not load any existing session first. While you can just set this to true, you probably want to set it to a function that decides when to save a session when launched with file args. See documentation for more detail
  continue_restore_on_error = true,   -- Keep loading the session even if there's an error
  show_auto_restore_notif = false,    -- Whether to show a notification when auto-restoring
  cwd_change_handling = false,        -- Follow cwd changes, saving a session before change and restoring after
  lsp_stop_on_restore = false,        -- Should language servers be stopped when restoring a session. Can also be a function that will be called if set. Not called on autorestore from startup
  log_level = "error",                -- Sets the log level of the plugin (debug, info, warn, error).

  session_lens = {
    load_on_setup = true, -- Initialize on startup (requires Telescope)
    theme_conf = {        -- Pass through for Telescope theme options
      layout_strategy = "horizontal",
      theme = "dropdown",
      layout_config = {  -- As one example, can change width/height of picker
        prompt_position = "top",
        height = 0.5,
        width = 0.75,
        scroll_speed = 1
      },
    },
    previewer = true, -- File preview for session picker

    mappings = {
      -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
      delete_session = { "i", "<C-D>" },
      alternate_session = { "i", "<C-S>" },
      copy_session = { "i", "<C-Y>" },
    },

    session_control = {
      control_dir = vim.fn.stdpath "data" .. "/auto_session/", -- Auto session control dir, for control files, like alternating between two sessions with session-lens
      control_filename = "session_control.json",               -- File name of the session control file
    },
  },
}
