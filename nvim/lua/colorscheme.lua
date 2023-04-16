local function SetHighlights(highlight_list, setting)
  for _, hl in ipairs(highlight_list) do
    vim.api.nvim_set_hl(0, hl, setting)
  end
end

function SetColorScheme(colorscheme)
  vim.cmd('colorscheme ' .. colorscheme)

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
    {
      'BufferLineBufferSelected', 'TelescopeBorder',
      'Cursor', 'TermCursor', 'MiniAnimateCursor', 'CursorLineNr'
    },
    { fg = 'DarkSeaGreen', bold = true }
  )

  SetHighlights(
    { 'MiniIndentscopeSymbol', },
    { fg = 'MediumPurple' }
  )

  --SetHighlights({ 'VertSplit' }, { fg = '#5E66A6' });
end

SetColorScheme('nightfox')
