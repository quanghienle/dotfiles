--vim.cmd('colorscheme iceberg')
--vim.cmd('colorscheme catppuccin-mocha')
vim.cmd('colorscheme nord')

local green = "#0be80d"
local darkblue = "#5E66A6"
local purple = "#f802ea"

local bg_color = "#27272B"
--local bg_color = "#191b24"
--local bg_color = "#191c23"
vim.api.nvim_set_hl(0, 'Normal', { bg = bg_color });

---- transparent background
--vim.api.nvim_set_hl(0, 'Normal', {bg = "None"});

vim.api.nvim_set_hl(0, 'SignColumn', { link = "Normal" })

vim.api.nvim_set_hl(0, 'TelescopeNormal', { link = "Normal" })
vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = green, bold = true });
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { fg = green });
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = green });
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = green });

vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = purple, bg = "None" });
vim.api.nvim_set_hl(0, 'VertSplit', { fg = darkblue, bold = true });
