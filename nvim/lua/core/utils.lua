local M = {}

M.color = {
  none = "None",
  black = "#000000",
  normal_bg = "#192330",
  light_bg = "#303142",
  lighter_bg = "#3D3E4E",
  dark_bg = "#121a24",
  darker_bg = "#131a24",
  purple = "MediumPurple",
  green = "DarkSeaGreen",
  blue = "#80A7EA",
  slate_blue = "SlateBlue",
  coral = "#f7768e",
  ERROR = "#c94f6d",
  WARN = "#dbc074",
  INFO = "#719cd6",
  HINT = "#81b29a",
}

M.signs = {
  Error = " ",
  Warn = " ",
  Info = " ",
  Hint = " ",
}

M.signs_lower = {
  error = "",
  warn = "",
  info = "",
  hint = "",
}

M.separator = {
  left = "",
  right = ""
}

M.customize_lualine_section = function(opts, bg, fg)
  if bg or fg then
    opts.color = { bg = M.color[bg], fg = M.color[fg] }
  end

  opts.separator = M.separator
  return opts
end

M.has_diagnostic = function()
  local diagnostics = vim.lsp.diagnostic.get_line_diagnostics()
  if not next(diagnostics) then
    return false
  else
    return true
  end
end

M.get_diagnostic_hl = function()
  local diagnostics = vim.lsp.diagnostic.get_line_diagnostics()
  if not next(diagnostics) then
    return { link = "Normal" }
  else
    local severity_level = diagnostics[1].severity
    local severity = vim.diagnostic.severity[severity_level]
    return { bg = M.color.none, fg = M.color[severity] }
  end
end


M.get_diagnostic_message = function()
  local diagnostics = vim.lsp.diagnostic.get_line_diagnostics()
  if not next(diagnostics) then
    return nil
  else
    local severity_level = diagnostics[1].severity
    local severity = vim.diagnostic.severity[severity_level]
    local icon = M.signs_lower[string.lower(severity)]

    local msg = diagnostics[1].message
    if string.len(msg) > 50 then
      msg = string.sub(msg, 0, 50) .. "..."
    end
    --return "[" .. icon .. " " .. severity .. "] " .. msg
    return icon .. " " .. msg
  end
end


M.get_lsp_name = function()
  local msg = 'No Active LSP'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return "  " .. client.name
    end
  end
  return "  " .. msg
end

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

  local function callback(input)
    if input then
      require("telescope.builtin").live_grep({ cwd = input })
    end
  end
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
    if input then
      local width = tonumber(input)
      vim.opt.shiftwidth = width
      vim.opt.softtabstop = width
      vim.opt.tabstop = width
    end
  end
  vim.ui.input({ prompt = "Enter value for shiftwidth" }, callback)
end


return M
