require("toggleterm").setup {
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,

  direction = 'float', -- | 'horizontal' | 'window' | 'float',
  float_opts = {
    border = 'curved', -- single/double/shadow/curved
    width = 170,
    height = 30,
  },
  highlights = {
    FloatBorder = {
      link = 'FloatBorder'
    },
  }
}

local lazygit = require('toggleterm.terminal').Terminal:new({
  cmd = 'lazygit',
  hidden = true,
  direction = 'float'
})

function LazyGitToggle()
  lazygit:toggle()
end
