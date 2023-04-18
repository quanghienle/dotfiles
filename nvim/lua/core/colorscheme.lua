require("nightfox").setup()

function SetColorScheme(colorscheme, transparent)
  vim.cmd.colorscheme(colorscheme)

  local float_bg_color = "#131a24"
  local highlights = {
    {
      groups = {
        "NotifyBackground",
        "NormalFloat",
        "WhichKeyFloat",
        "Pmenu",
        "TelescopeNormal",
        "NoiceCmdlinePopup"
      },
      opts = { bg = float_bg_color}
    },
    {
      groups = {
        "FloatBorder",
        "LspFloatWinBorder",
        "NoiceCmdlinePopupBorderSearch",
        "NoiceCmdlinePopupBorder",
        "LspSagaCodeActionBorder",
        "LspSagaHoverBorder",
        "CmpDocumentationBorder",
        "TelescopePreviewBorder",
        "TelescopePromptBorder",
        "TelescopeResultsBorder",
      },
      --opts = { fg = "CornFlowerBlue", bg = float_bg_color }
      opts = { fg = float_bg_color, bg = float_bg_color } -- no border
    },
    {
      groups = { "Cursor", "TermCursor", "MiniAnimateCursor" },
      opts = { fg = "Black", bg = "MediumPurple" }
    },
    {
      groups = {
        "Title", "FloatTitle",
        "BufferLineBufferSelected",
        "TelescopeBorder",
        --"VertSplit",
        "CursorLineNr",
      },
      opts = { fg = "DarkSeaGreen", bold = true }
    },
  }

  if transparent == true then
    table.insert(highlights, 1,
      {
        groups = { "Normal", "NormalNC", "NvimTreeNormal" },
        opts = { bg = "None" }
      }
    )
  end

  for _, hl in ipairs(highlights) do
    for _, group in ipairs(hl.groups) do
      vim.api.nvim_set_hl(0, group, hl.opts)
    end
  end

  -- set diagnostic signs
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end


SetColorScheme("nightfox", false)
