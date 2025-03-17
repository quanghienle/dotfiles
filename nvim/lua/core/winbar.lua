local M = {}

local utils = require("core.utils")

M.winbar_filetype_exclude = {
  "help", "packer", "NvimTree",
  "Trouble", "Outline", "spectre_panel"
}

M.get_winbar = function()
  if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
    --vim.opt_local.winbar = nil
    return ""
  else
    -- :help statusline
    local icon = "" --require("nvim-web-devicons").get_icon_by_filetype(vim.bo.filetype) or ""
    local diag = "" -- %{%v:lua.require'core.utils'.get_truncated_diagnostic()%}"

    local gitblame = "%{get(b:,'gitsigns_blame_line','')}"
    local right_align = "%="
    local file_name = "%-t"
    --local file_name = "%-f"
    local separtor_hl = "%#MyWinBarSeparator#"
    local filename_hl = "%#MyWinBarFileName#"
    local gitblame_hl = "%#MyWinBarGitBlame#"
    --return separtor_hl .. utils.separator.left .. filename_hl .. " " .. icon .. file_name .. " " .. separtor_hl .. utils.separator.right .. " " .. diag
    --return  separtor_hl .. diag .. right_align .. separtor_hl .. utils.separator.left .. filename_hl .. " " .. icon .. file_name .. " " .. separtor_hl .. utils.separator.right
    return  separtor_hl .. diag .. right_align .. separtor_hl .. utils.separator.left .. filename_hl .. " " .. icon .. file_name .. "  "
    --return gitblame_hl .. right_align .. "\"" .. gitblame .."\" " ..
    --  separtor_hl .. utils.separator.left .. filename_hl .. file_name ..
    --  separtor_hl .. utils.separator.right
    --return right_align .. filename_hl .. "⟪ " .. file_name .. " ⟫  "
  end
end

M.set_winbar = function()
  vim.opt.winbar = "%{%v:lua.require'core.winbar'.get_winbar()%}"
end

return M
