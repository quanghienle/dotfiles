local utils = require("core.utils")

-- wrap lines for Telescope Preview
vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  command = "setlocal wrap number"
})


-- exclude filetypes for mini.indentscope
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help", "Trouble", "NvimTree", "mason" },
  callback = function() vim.b.miniindentscope_disable = true end,
})

-- Set highlight group for SymbolsOutline
vim.api.nvim_set_hl(0, "MyOutlineNormal", { bg = utils.color.darker_bg })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "Outline",
  callback = function()
    vim.opt_local.winhighlight = "Normal:MyOutlineNormal,NormalNC:MyOutlineNormal,WinBar:MyOutlineNormal"
    vim.opt.signcolumn = "no"
  end
})
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'copilot-*',
  callback = function()
    vim.opt_local.winhighlight = "Normal:MyOutlineNormal,NormalNC:MyOutlineNormal,WinBar:MyOutlineNormal"
    -- Set buffer-local options
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.conceallevel = 0
  end
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = utils.augroup("highlight_yank"),
  callback = function() vim.highlight.on_yank() end,
})

-- show cursorline for active window only
local cursorline_group = utils.augroup("set_cursorline")
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
  group = cursorline_group,
  callback = function()
    vim.opt.cursorline = true
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = cursorline_group,
  pattern = "TelescopePrompt",
  callback = function()
    vim.opt.cursorline = false
  end,
})
vim.api.nvim_create_autocmd("WinLeave", {
  group = cursorline_group,
  callback = function()
    vim.opt.cursorline = false
  end,
})

-- auto-session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
