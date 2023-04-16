--[[
+-------------------------------------------------+
| A | B | C                             X | Y | Z |
+-------------------------------------------------+
components:
    branch (git branch)
    buffers (shows currently available buffers)
    diagnostics (diagnostics count from your prefered source)
    diff (git diff status)
    encoding (file encoding)
    fileformat (file format)
    filename
    filesize
    filetype
    hostname
    location (location in file in line:column format)
    mode (vim mode)
    progress (%progress in file)
    tabs (shows currently available tabs)
]]
require "lualine".setup {
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      "diagnostics",
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { "filename", path = 1 }
    },
    lualine_x = { "diff" },
    lualine_y = { "progress" },
    lualine_z = { "location" }
  }
}
