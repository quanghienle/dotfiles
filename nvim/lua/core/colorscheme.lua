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
    { groups = { "MyWinBarNormal" }, opts = { fg = fg, bg = bg } },
    { groups = { "MyWinBarSeparator" }, opts = { fg = bg } },
  }
end

local bufferline_hl = function(selected_tab_bg, inactive_tab_bg)
  return {
    {
      groups = { "BufferLineFill" },
      opts = { link = "Normal" }
    },
    {
      groups = { "BufferLineTab", "BufferLineBackground", "BufferLineModified" },
      opts = { bg = inactive_tab_bg }
    },
    {
      groups = {
        "BufferLineTabSelected", "BufferLineTabSeparatorSelected",
        "BufferLineBufferSelected", "BufferLineModifiedSelected", "BufferLineSeparatorSelected",
      },
      opts = { fg = utils.color.normal_bg, bg = selected_tab_bg, bold = true }
    },
    {
      groups = { "BufferLineSeparatorVisible", "BufferLineSeparator", "BufferLineTabSeparator" },
      opts = { fg = utils.color.normal_bg, bg = inactive_tab_bg, }
    },
    {
      groups = { "BufferLineModifiedVisible", "BufferLineBufferVisible" },
      opts = { fg = selected_tab_bg, bg = inactive_tab_bg, bold = true }
    }
  }
end

local float_hl = function(border_color, title_color)
  return {
    {
      groups = {
        "NotifyBackground", "NormalFloat", "WhichKeyFloat",
        "Pmenu", "TelescopeNormal", "NoiceCmdlinePopup",
        "NvimTreeNormal", "BufferLineFill", "lualine_c_normal"
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
      groups = { "CursorLineNr", "Title", "FloatTitle", "TelescopeBorder" },
      opts = { fg = title_color, bold = true }
    },
  }
end


local other_hl = function ()
  return {
    {
      groups = { "GitSignsCurrentLineBlame"},
      opts = { link = "Comment" }
    },
  }
  
end

SetColorscheme = function(colorscheme)
  vim.cmd.colorscheme(colorscheme)

  set_hl_groups(float_hl(utils.color.slate_blue, utils.color.blue))
  set_hl_groups(bufferline_hl(utils.color.blue, utils.color.light_bg))
  set_hl_groups(winbar_hl(utils.color.blue, utils.color.darker_bg))
  set_hl_groups(other_hl())
end

SetColorscheme("nightfox")
