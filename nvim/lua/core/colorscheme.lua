local function SetHighlights(highlight_list, setting)
  for _, hl in ipairs(highlight_list) do
    vim.api.nvim_set_hl(0, hl, setting)
  end
end

function SetColorScheme(colorscheme)
  vim.cmd('colorscheme ' .. colorscheme)

  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  SetHighlights(
    { 'NormalFloat', 'WhichKeyFloat', 'Pmenu' },
    { link = "Normal" }
  )

  SetHighlights(
    {
      'FloatBorder', 'LspFloatWinBorder',
      'NoiceCmdlinePopupBorderSearch',
      'LspSagaCodeActionBorder', 'LspSagaHoverBorder', 'CmpDocumentationBorder',
      'TelescopePreviewBorder', 'TelescopePromptBorder', 'TelescopeResultsBorder',
    },
    { fg = 'CornFlowerBlue' }
  )

  SetHighlights(
    { 'BufferLineBufferSelected', 'TelescopeBorder', },
    { fg = 'DarkSeaGreen', bold = true }
  )

  SetHighlights(
    { 'MiniIndentscopeSymbol', 'CursorLineNr' },
    { fg = 'MediumPurple' }
  )

  SetHighlights(
    { 'Cursor', 'TermCursor', 'MiniAnimateCursor' },
    { fg = 'Black', bg = 'MediumPurple' }
  )

  --SetHighlights({ 'VertSplit' }, { fg = '#5E66A6' });
end

SetColorScheme('nightfox')
