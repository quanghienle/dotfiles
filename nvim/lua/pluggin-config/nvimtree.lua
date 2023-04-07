-- :help nvim-tree-setup

require 'nvim-tree'.setup {
  open_on_setup = true,
  --actions = {
  --  open_file = {
  --    quit_on_open = true
  --  }
  --},
  view = {
    width = {
      min = 25,
      max = 50
    },
    hide_root_folder = false,
    side = 'left',
    number = true,
    relativenumber = true,
    preserve_window_proportions = true, -- do not resize windows
    centralize_selection = true
  },
  renderer = {
    icons = {
      show = {
        git = false,
        --file = false
      }
    },
    indent_width = 1,
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
