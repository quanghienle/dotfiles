local utils = require("core.utils")

-- wrap lines for Telescope Preview
vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  command = "setlocal wrap number"
})

-- Set highlight group for SymbolsOutline
vim.api.nvim_set_hl(0, "MyOutlineNormal", { bg = utils.color.darker_bg })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "Outline",
  callback = function()
    vim.opt_local.winhighlight = "Normal:MyOutlineNormal,NormalNC:MyOutlineNormal"
    vim.opt.signcolumn = "no"
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
  callback = function() vim.opt.cursorline = true end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = cursorline_group,
  pattern = "TelescopePrompt",
  callback = function() vim.opt.cursorline = false end,
})
vim.api.nvim_create_autocmd("WinLeave", {
  group = cursorline_group,
  callback = function() vim.opt.cursorline = false end,
})

-- auto load session
vim.api.nvim_create_autocmd("VimEnter", {
  group = utils.augroup("session_autoload"),
  callback = utils.load_session,
  nested = true,
})
