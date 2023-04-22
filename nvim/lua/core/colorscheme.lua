require("nightfox").setup()

local utils = require("core.utils")

utils.set_diagnostic_signs()

MyColorscheme = function(colorscheme)
  vim.cmd.colorscheme(colorscheme)

  local highlights = {
    {
      groups = {
        "NotifyBackground", "NormalFloat", "WhichKeyFloat",
        "Pmenu", "TelescopeNormal", "NoiceCmdlinePopup",
        "NvimTreeNormal"--, "BufferLineFill", "BufferLineSeparator"
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
      opts = { fg = utils.color.slate_blue }
    },
    {
      groups = { "BufferLineBufferSelected", "BufferLineNumbersSelected"},
      opts = { fg = utils.color.blue, bg = utils.color.light_bg, bold = true }
    },
    {
      groups = { "BufferLineBufferVisible","BufferLineNumbersVisible",},
      opts = { fg = utils.color.blue, bg = utils.color.dark_bg}
    },
    {
      groups = { "CursorLineNr", "Title", "FloatTitle", "TelescopeBorder" },
      opts = { fg = utils.color.blue, bold = true }
    },
  }
  for _, hl in ipairs(highlights) do
    for _, group in ipairs(hl.groups) do
      vim.api.nvim_set_hl(0, group, hl.opts)
    end
  end
end

MyColorscheme("nightfox")
