local M = {}

local utils = require("core.utils")


M.winbar_filetype_exclude = {
  "help", "dashboard", "packer", "NvimTree",
  "Trouble", "Outline", "spectre_panel"
}

M.get_winbar = function()
  if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
    return "" --vim.opt_local.winbar = nil
  else
    -- :help statusline
    local icon = "" --require("nvim-web-devicons").get_icon_by_filetype(vim.bo.filetype) or ""

    --local gitblame = "%{get(b:,'gitsigns_blame_line','')}"
    local right_align = "%="
    local file_name = "%-t"
    local separtor_hl = "%#MyWinBarSeparator#"
    local filename_hl = "%#MyWinBarNormal#"
    --local gitblame_hl = "%#MyWinBarGitBlame#"
    --return right_align ..
        --separtor_hl .. utils.separator.left ..
        --filename_hl .. " " .. icon .. file_name .. " " ..
        --separtor_hl .. utils.separator.right .. "  "
    --return right_align .. gitblame_hl .. "Git Blame: \"" .. gitblame .."\" " .. filename_hl .. "[ " .. file_name .. " ]  "
    return right_align .. filename_hl .. "[ " .. file_name .. " ]  "
  end
end

M.set_winbar = function()
  vim.opt.winbar = "%{%v:lua.require'core.winbar'.get_winbar()%}"
  --vim.opt.winbar = M.get_winbar()
end

return M
