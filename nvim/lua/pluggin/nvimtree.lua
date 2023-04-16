-- :help nvim-tree-setup

require 'nvim-tree'.setup {
  open_on_setup = true,
  --actions = {
  --  open_file = {
  --    quit_on_open = true
  --  }
  --},
  view = {
    width = { min = 40, max = 80 },
    hide_root_folder = false,
    side = 'left',
    number = false,
    relativenumber = false,
    preserve_window_proportions = true, -- do not resize windows
    centralize_selection = true
  },
  renderer = {
    icons = {
      show = {
        git = false,
        file = true,
        folder = true,
      }
    },
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = false,
    },
  },
  trash = {
    cmd = "trash"
  },
  ui = {
    confirm = {
      remove = true,
      trash = true,
    },
  },
  update_focused_file = {
    enable = true
  }
}
