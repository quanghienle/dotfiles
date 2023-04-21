local M = {}

M.color = {
  darker_bg = "#131a24",
  purple = "MediumPurple",
  green = "DarkSeaGreen",
  slate_blue = "SlateBlue",
}

M.signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " "
}


M.list_lsp = function()
  local buf_clients = vim.lsp.buf_get_clients()
  if next(buf_clients) == nil then
    return "[-]"
  end
  local buf_client_names = {}
  for _, client in pairs(buf_clients) do
    if client.name ~= "null-ls" then
      table.insert(buf_client_names, client.name)
    end
  end
  return table.concat(buf_client_names, " | ")
end

-- set diagnostic signs
M.set_diagnostic_signs = function()
  for type, icon in pairs(M.signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

M.finetune_colorscheme = function(colorscheme)
  vim.cmd.colorscheme(colorscheme)

  local highlights = {
    {
      groups = {
        "NotifyBackground", "NormalFloat", "WhichKeyFloat",
        "Pmenu", "TelescopeNormal", "NoiceCmdlinePopup"
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
      opts = { fg = M.color.slate_blue, bg = "None" }
    },
    {
      groups = { "BufferLineBufferSelected", "CursorLineNr", "Title", "FloatTitle", "TelescopeBorder" },
      opts = { fg = M.color.green }
    },
  }

  for _, hl in ipairs(highlights) do
    for _, group in ipairs(hl.groups) do
      vim.api.nvim_set_hl(0, group, hl.opts)
    end
  end
end

M.load_session = function()
  require("nvim-tree.api").tree.toggle()
  if require("session_manager.config").dir_to_session_filename():exists() then
    vim.ui.select(
      { "Yes", "No" },
      {
        prompt = " Load previously saved session? ",
        format_item = function(item) return "   " .. item end
      },
      function(choice)
        if choice == "Yes" then
          require("session_manager").load_current_dir_session()
        end
      end
    )
  end
end

M.augroup = function(name)
  return vim.api.nvim_create_augroup("custom_augroup_" .. name, { clear = true })
end


M.find_in_path = function()
  local path = vim.fn.expand("%:p")
  if vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), "filetype") == "NvimTree" then
    path = require("nvim-tree.api").tree.get_node_under_cursor().absolute_path
  end

  local function callback(input) require("telescope.builtin").live_grep({ cwd = input }) end
  vim.ui.input(
    { prompt = " Search in directory ", default = path },
    callback
  )
end

M.live_grep_cursor = function()
  local word
  local visual = vim.fn.mode() == "v"

  if visual == true then
    vim.cmd [[noautocmd sil norm "vy]]
    word = vim.fn.getreg "v"
  else
    word = vim.fn.expand "<cword>"
  end
  require("telescope.builtin").live_grep({
    default_text = word,
    initial_mode = "normal",
  })
end

M.toggle_bufferline = function()
  vim.opt.showtabline = vim.api.nvim_get_option("showtabline") == 0 and 2 or 0
end

M.show_popup_info = function()
  if vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), "filetype") == "NvimTree" then
    require("nvim-tree.api").node.show_info_popup()
  else
    vim.lsp.buf.hover()
  end
end

M.set_tabwidth = function()
  local function callback(input)
    local width = tonumber(input)
    vim.opt.shiftwidth = width
    vim.opt.softtabstop = width
    vim.opt.tabstop = width
  end
  vim.ui.input({ prompt = "Enter value for shiftwidth" }, callback)
end


return M
