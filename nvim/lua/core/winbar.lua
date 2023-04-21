local M = {}

local utils = require("core.utils")



vim.api.nvim_set_hl(0, "WinBarSeparator", { fg = utils.color.darker_bg })
vim.api.nvim_set_hl(0, "WinBarFilename", { fg = utils.color.purple, bg = utils.color.darker_bg })

M.winbar_filetype_exclude = {
  "help", "startify", "dashboard", "packer",
  "neogitstatus", "NvimTree", "Trouble", "alpha",
  "lir", "Outline", "spectre_panel", "toggleterm",
}

M.separator = {
  --left = '',
  --right = '',
  left = "",
  right = ""
}


M.get_winbar = function()
  if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
    --vim.opt_local.winbar = nil
    return ""
  else
    --local modified = "%-m"
    --local line_no = "%10([%l/%L%)]"
    --local file_type = " %y"
    --local pct_thru_file = "%5p%%"
    local right_align = "%="
    local left_sep = "%#WinBarSeparator#" .. M.separator.left
    local right_sep = "%#WinBarSeparator#" .. M.separator.right
    local file_name = "%#WinBarFilename#" .. " %-t "
    local icon = "%#WinBarFilename# " .. require("nvim-web-devicons").get_icon_by_filetype(vim.bo.filetype)
    return right_align .. left_sep .. icon .. file_name .. right_sep .. "  "
  end
end

M.set_winbar = function()
  vim.opt.winbar = "%{%v:lua.require'core.winbar'.get_winbar()%}"
  --vim.opt.winbar = M.get_winbar()
end

return M
