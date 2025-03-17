require("nightfox").setup({})

local utils = require("core.utils")


local set_hl_groups = function(highlights)
  for _, hl in ipairs(highlights) do
    for _, group in ipairs(hl.groups) do
      vim.api.nvim_set_hl(0, group, hl.opts)
    end
  end
end

local winbar_hl = function(fg, bg)
  return {
    { groups = { "MyWinBarFileName" },  opts = { fg = fg, bg = bg } },
    { groups = { "MyWinBarSeparator" }, opts = { fg = bg } },
    { groups = { "MyWinBarGitBlame" },  opts = { fg = "CornFlowerBlue", bg = utils.color.darker_bg } },
  }
end

local float_hl = function(border_color, title_color)
  return {
    {
      groups = {
        "NotifyBackground", "NormalFloat", "WhichKeyFloat", "CopilotChatSuggestion",
        "Pmenu", "TelescopeNormal", "NoiceCmdlinePopup", "TelescopePreviewNormal",
      },
      --opts = { link = "Normal" }
      opts = { bg = utils.color.darker_bg }
    },
    {
      groups = {
        "WinSeparator", "FloatBorder", "LspInfoBorder", "LspFloatWinBorder", "CmpDocumentationBorder",
        "NoiceCmdlinePopupBorderSearch", "NoiceCmdlinePopupBorder",
        "LspSagaCodeActionBorder", "LspSagaHoverBorder",
        "TelescopePreviewBorder", "TelescopePromptBorder", "TelescopeResultsBorder",
      },
      opts = { fg = border_color, bg = utils.color.darker_bg }
      --opts = { fg = utils.color.darker_bg, bg = utils.color.darker_bg }
    },
    {
      groups = { "Title", "FloatTitle", "TelescopeBorder" },
      opts = { fg = title_color, bg = utils.color.darker_bg, bold = true }
      --opts = { bg = title_color, fg = utils.color.darker_bg, bold = true }
    },
  }
end

--local buffer_hl = function(accent_color)
  --return {
    --{
      --groups = { "BufferlineBufferSelected",  "BufferlineDuplicateSelected" },
      --opts = { bg = accent_color, fg = "black", bold = true }
    --},
    --{
      --groups = { "BufferlineModifiedSelected" },
      --opts = { bg = accent_color, fg = "lime", bold = true }
    --},
    --{
      --groups = { "BufferlineIndicatorSelected" },
      --opts = { bg = accent_color }
    --},
    --{
      --groups = { "BufferlineIndicatorVisible" },
      --opts = { bg = utils.color.darker_bg }
    --},
    --{
      --groups = { "BufferlineFill", "BufferlineBufferVisible", "BufferlineBackground" },
      --opts = { bg = utils.color.darker_bg, fg = accent_color }
    --},
  --}
--end

local buffer_hl = function(accent_color)
  return {
    {
      groups = { "BufferlineBufferSelected",  "BufferlineDuplicateSelected" },
      opts = { bg = "None", fg = "MediumPurple", bold = true }
    },
    {
      groups = { "BufferlineModifiedSelected" },
      opts = { bg = "None", fg = "Teal", bold = true }
    },
    {
      groups = { "BufferlineIndicatorSelected", "BufferlineIndicatorVisible", "BufferlineSeparator" },
      opts = { bg = "None", fg = "black" }
    },
    {
      groups = { "BufferlineFill", "BufferlineBufferVisible", "BufferlineBackground" },
      opts = { bg = "None", fg = "SlateGray" }
    },
  }
end

local other_hl = function()
  return {
    --{
    --  groups = { "NvimTreeNormal" },
    --  opts = { link = "Normal" }
    --},
    {
      groups = { "Cursor", "CursorLineNr" },
      opts = { fg = "CornFlowerBlue", bold = true }
    },
    {
      groups = { "MyOutlineNormal" },
      opts = { link = "NvimTreeNormal" }
    },
    {
      groups = { "WinSeparator" },
      opts = { fg = "DarkSlateBlue" }
    },
    {
      groups = { "MiniIndentscopeSymbol" },
      opts = { fg = "DarkSlateGray" }
    },
    {
      groups = { "MiniJump" },
      opts = { bg = "None", underline = true, bold = true }
    },
    {
      groups = { "NvimTreeWindowPicker" },
      opts = { fg = "White", bg = "DarkSlateBlue", bold = true }
    },
    {
      groups = { "@define", "@include" },
      opts = { link = "@field" }
    },
    {
      groups = { "@keyword.return", "@variable.builtin", "@function.builtin" },
      opts = { link = "@keyword" }
    },
    {
      groups = { "@type", "@constant", "@lsp.type.type", "@lsp.type.class", "@lsp.type.typeParameter", "@lsp.type.truct" },
      opts = { link = "@text" }
    },
  }
end

SetColorscheme = function(colorscheme)
  vim.cmd.colorscheme(colorscheme)
  --vim.api.nvim_set_hl(0, "Normal", {bg = utils.color.normal_bg})

  --set_hl_groups(float_hl(utils.color.darker_bg, "CornFlowerBlue"))
  set_hl_groups(float_hl( "CornFlowerBlue", "CornFlowerBlue"))
  set_hl_groups(winbar_hl("black", "DarkSlateGray"))
  set_hl_groups(buffer_hl("SteelBlue"))
  set_hl_groups(other_hl())
end


utils.set_diagnostic_signs()
SetColorscheme("nightfox")
