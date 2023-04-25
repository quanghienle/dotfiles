require("nightfox").setup({
})

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
    { groups = { "MyWinBarNormal" },    opts = { fg = fg, bg = bg } },
    { groups = { "MyWinBarGitBlame" },  opts = { link = "Comment" } },
    { groups = { "MyWinBarSeparator" }, opts = { fg = bg } },
  }
end

local float_hl = function(border_color, title_color)
  return {
    {
      groups = {
        "NotifyBackground", "NormalFloat", "WhichKeyFloat",
        "Pmenu", "TelescopeNormal", "NoiceCmdlinePopup", "TelescopePreviewNormal",
      },
      --opts = { link = "Normal" }
      opts = { bg = utils.color.darker_bg }
    },
    {
      groups = {
        "WinSeparator", "FloatBorder", "LspFloatWinBorder", "CmpDocumentationBorder",
        "NoiceCmdlinePopupBorderSearch", "NoiceCmdlinePopupBorder",
        "LspSagaCodeActionBorder", "LspSagaHoverBorder",
        "TelescopePreviewBorder", "TelescopePromptBorder", "TelescopeResultsBorder",
      },
      opts = { fg = border_color, bg = utils.color.darker_bg }
    },
    {
      groups = { "Title", "FloatTitle", "TelescopeBorder" },
      opts = { fg = title_color, bg = utils.color.darker_bg, bold = true }
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
      opts = { fg = "MediumPurple", bold = true }
    },
    {
      groups = { "MyOutlineNormal" },
      opts = { link = "NvimTreeNormal" }
    },
    {
      groups = { "GitSignsCurrentLineBlame" },
      opts = { link = "Comment" }
    },
    {
      groups = { "WinSeparator" },
      opts = { fg = "DarkSlateBlue" }
    },
    {
      groups = { "BufferlineBufferSelected" },
      opts = { fg = "CornFlowerBlue", bold = true }
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
      groups = { "@type", "@lsp.type.type", "@lsp.type.class", "@lsp.type.typeParameter", "@lsp.type.truct" },
      opts = { link = "@text" }
    },
  }
end

SetColorscheme = function(colorscheme)
  vim.cmd.colorscheme(colorscheme)
  --vim.api.nvim_set_hl(0, "Normal", {bg = utils.color.normal_bg})

  set_hl_groups(float_hl("CornFlowerBlue", "CornFlowerBlue"))
  set_hl_groups(winbar_hl("CornFlowerBlue", "None"))
  set_hl_groups(other_hl())
end


utils.set_diagnostic_signs()
SetColorscheme("nightfox")
