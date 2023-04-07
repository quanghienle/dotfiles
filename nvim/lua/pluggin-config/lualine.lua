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
require 'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'nord',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', { 'diagnostics', sources = { 'nvim_lsp', 'coc' } } },
    lualine_c = { 'filename' },
    lualine_x = { 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'filetype' },
    lualine_y = { 'location' },
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
