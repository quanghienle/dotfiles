require("nightfox").setup()

local utils = require("core.utils")

utils.set_diagnostic_signs()

local set_hl_groups = function(highlights)
  for _, hl in ipairs(highlights) do
    for _, group in ipairs(hl.groups) do
      vim.api.nvim_set_hl(0, group, hl.opts)
    end
  end
end

local winbar_hl = function(fg, bg)
  return {
    { groups = { "MyWinBarNormal" },    opts = { fg = fg, bg = bg } },
    { groups = { "MyWinBarSeparator" }, opts = { fg = bg } },
  }
end

local bufferline_hl = function(selected_tab_fg, tab_bg)
  return {
    {
      groups = { "BufferLineFill" },
      opts = { link = "Normal" }
    },
    {
      groups = {
        "BufferLineTab", "BufferLineBackground", "BufferLineModified",
        "BufferLineModifiedVisible", "BufferLineBufferVisible"
      },
      opts = { bg = tab_bg }
    },
    {
      groups = { "BufferLineTabSeparatorSelected", "BufferLineSeparatorSelected" },
      opts = { fg = utils.color.normal_bg, bg = tab_bg, bold = true }
    },
    {
      groups = { "BufferLineTabSelected", "BufferLineBufferSelected", "BufferLineModifiedSelected" },
      opts = { fg = selected_tab_fg, bg = tab_bg }
    },
    {
      groups = { "BufferLineSeparatorVisible", "BufferLineSeparator", "BufferLineTabSeparator" },
      opts = { fg = utils.color.normal_bg, bg = tab_bg, }
    },
  }
end

local float_hl = function(border_color, title_color)
  return {
    {
      groups = {
        "NotifyBackground", "NormalFloat", "WhichKeyFloat",
        "Pmenu", "TelescopeNormal", "NoiceCmdlinePopup",
        "NvimTreeNormal", "BufferLineFill", "SignColumn"
      },
      opts = { link = "Normal" }
    },
    {
      groups = {
        "WinSeparator", "FloatBorder", "LspFloatWinBorder", "CmpDocumentationBorder",
        "NoiceCmdlinePopupBorderSearch", "NoiceCmdlinePopupBorder",
        "LspSagaCodeActionBorder", "LspSagaHoverBorder",
        "TelescopePreviewBorder", "TelescopePromptBorder", "TelescopeResultsBorder",
      },
      opts = { fg = border_color }
    },
    {
      groups = { "Cursor", "CursorLineNr", "Title", "FloatTitle", "TelescopeBorder" },
      opts = { fg = title_color, bold = true }
    },
  }
end


local other_hl = function()
  return {
    {
      groups = { "GitSignsCurrentLineBlame" },
      opts = { link = "Comment" }
    },
    {
      groups = { "WinSeparator" },
      opts = { fg = "Black" }
    },
    {
      groups = { "@define", "@include" },
      opts = { link = "@method"}
    },
  }
end

SetColorscheme = function(colorscheme)
  vim.cmd.colorscheme(colorscheme)
  --vim.api.nvim_set_hl(0, "Normal", {bg = utils.color.normal_bg })

  set_hl_groups(float_hl("LightSeaGreen", "LightSeaGreen"))
  set_hl_groups(bufferline_hl("CornFlowerBlue", utils.color.almost_black))
  set_hl_groups(winbar_hl("DarkCyan", "None")) --utils.color.almost_black))
  set_hl_groups(other_hl())
end

SetColorscheme("nightfox")
