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


  local float_bg_color = "#131a24"
  local accent_color = 'MediumPurple'
  local border_color = 'CornFlowerBlue'

  local float_normals = {
    'NormalFloat',
    'WhichKeyFloat',
    'Pmenu',
    'TelescopeNormal',
    'NoiceCmdlinePopup'
  }
  local float_borders = {
    'FloatBorder',
    'LspFloatWinBorder',
    'NoiceCmdlinePopupBorderSearch',
    'LspSagaCodeActionBorder',
    'LspSagaHoverBorder',
    'CmpDocumentationBorder',
    'TelescopePreviewBorder',
    'TelescopePromptBorder',
    'TelescopeResultsBorder',
  }
  local accents = {
    'BufferLineBufferSelected',
    'TelescopeBorder',
    'CursorLineNr',
  }
  local cursors = {
    'Cursor',
    'TermCursor',
    'MiniAnimateCursor'
  }


  SetHighlights(float_normals, { bg = float_bg_color })
  SetHighlights(float_borders, { fg = border_color, bg = float_bg_color })
  SetHighlights(accents, { fg = accent_color, bold = true })
  SetHighlights(cursors, { fg = 'Black', bg = accent_color })
  SetHighlights({ 'VertSplit' }, { fg = 'DarkSlateBlue' });
end

SetColorScheme('nightfox')
