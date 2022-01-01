--vim.cmd('colorscheme iceberg')
vim.cmd('colorscheme nord')

local green = "#0be80d"
local darkblue = "#414882"
local purple = "#f802ea"

--vim.highlight.create('Normal', { guibg = "None" }, false);
--vim.cmd[[highlight! link BufferLineFill Normal]];
vim.highlight.create('TelescopeBorder', { guifg = green, gui = "bold" }, false);
vim.highlight.create('CursorLineNr', { guifg = purple, guibg = "None"}, false);
vim.highlight.create('BufferLineBufferSelected', { guifg = green }, false);
--vim.highlight.create('LineNr', { guifg = darkblue, guibg = "None"}, false);
--vim.highlight.create('SignColumn', { guibg = "None"}, false);
vim.highlight.create('VertSplit', { guifg = darkblue, gui = "bold" }, false);

