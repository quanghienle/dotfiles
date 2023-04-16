local telescope = require('telescope.builtin')
local spectre = require("spectre")
local noice = require("noice")
local notify = require("notify")
local lsp = vim.lsp.buf
local nvimtree = require("nvim-tree.api")

function FindInPath()
  local path = vim.fn.expand('%:p')
  if vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), "filetype") == "NvimTree" then
    path = require("nvim-tree.api").tree.get_node_under_cursor().absolute_path
  end
  vim.ui.input(
    { prompt = 'Search in directory', default = path },
    function(input) require('telescope.builtin').live_grep({ cwd = input }) end
  )
end

function ShowPopupInfo()
  if vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), "filetype") == "NvimTree" then
    require("nvim-tree.api").node.show_info_popup()
  else
    vim.lsp.buf.hover()
  end
end

function SetTabWidth()
  vim.ui.input({ prompt = 'Enter value for shiftwidth' }, function(input)
    local width = tonumber(input)
    vim.opt.shiftwidth = width
    vim.opt.softtabstop = width
    vim.opt.tabstop = width
  end)
end

function LazyGitToggle()
  local lazygit = require('toggleterm.terminal').Terminal:new({
    cmd = 'lazygit',
    hidden = true,
    direction = 'float'
  })

  lazygit:toggle()
end

-- :help vim.keymap.set()
local function map(modes, lhs, rhs, description)
  vim.keymap.set(modes, lhs, rhs, { remap = false, silent = true, desc = description })
end

map('n', '<esc>', ':noh<cr><esc>', 'Escape and Remove highlight')

map('n', '<C-h>', '<C-w>h', 'Navigate to the Left pane')
map('n', '<C-j>', '<C-w>j', 'Navigate to the Bottom pane')
map('n', '<C-k>', '<C-w>k', 'Navigate to the Upper pane')
map('n', '<C-l>', '<C-w>l', 'Navigate to the Right pane')
map('x', 'K', ":move '<-2<cr>gv-gv", 'Move Visual Block up one line')
map('x', 'J', ":move '>+1<cr>gv-gv", 'Move Visual Block down one line')

map('v', '<', '<gv', 'Indent to the left')
map('v', '>', '>gv', 'Indent to the right')

map('n', 'G', 'Gzz', 'Go to bottom of file and center')
map('n', 'n', 'nzz', 'Go to next match and center')
map('n', 'N', 'Nzz', 'Go to previous match and center')

map('n', 'Y', 'y$', 'Yank to the end of line')
map('x', 'p', '\"_dP', 'Paste without yanking the visual text')


-- Don't yank on delete char
map({ 'n', 'v' }, 'x', '"_x', 'Delete character without yanking')
map({ 'n', 'v' }, 'X', '"_X', 'Delete character without yanking')
map({ 'n', 'v' }, 'c', '"_c', 'Delete character without yanking')
map({ 'n', 'v' }, 'C', '"_C', 'Delete character without yanking')
map({ 'n', 'v' }, 's', '"_s', 'Change character without yanking')


-- Buffers
map('n', '<leader>bd', ':bp<cr>:sp<cr>:bn<cr>:bd<cr>', 'Buffer: Delete')
map('n', '<leader>bn', ':bn<cr>', 'Buffer: Next')
map('n', '<Tab>', ':bn<cr>', 'Next Buffer')
map('n', '<leader>bp', ':bn<cr>', 'Buffer: Previous')
map('n', '<S-Tab>', ':bp<cr>', 'Previous Buffer')
map('n', '<leader>br', ':bufdo e<cr>', 'Buffer: Refresh')

-- Find
map('n', '<leader>ft', telescope.builtin, 'Find Telescope Pickers')
map('n', '<leader>ff', telescope.find_files, 'Find Files')
map('n', '<leader>fw', telescope.live_grep, 'Find Words (Live Grep)')
map('n', '<leader>fb', telescope.buffers, 'Find Buffers')
map('n', '<leader>fm', telescope.marks, 'Find Marks')
map('n', '<leader>fc', telescope.commands, 'Find Commands')
map('n', '<leader>fk', telescope.keymaps, 'Find Keymaps')
map('n', '<leader>fh', telescope.help_tags, 'Find Help-tags')
map('n', "<leader>fr", spectre.open, "Find and Replace in Project")
map('n', '<leader>fp', FindInPath, 'Find in Path (Live Grep)')

-- Show
map({ 'n', 'v' }, '<leader>sw', telescope.grep_string, 'Show Word occurences (under cursor)')
map('n', '<leader>su', telescope.lsp_references, 'Show Usages (under cursor)')
map('n', '<leader>ss', telescope.spell_suggest, 'Show Spelling suggestions (under cursor)')
map('n', '<leader>se', vim.diagnostic.open_float, 'Show Errors (under cursor)')
map('n', '<leader>sa', lsp.code_action, 'Show code-Actions (under cursor)')
map('n', '<leader>sd', function() telescope.diagnostics({ bufnr = 0 }) end, 'Show Diagnostics (current buffer)')
map('n', '<leader>si', ShowPopupInfo, 'Show Information (under cursor)')
map('n', '<leader>st', nvimtree.tree.toggle, 'Show NvimTree')
map('n', '<leader>sg', LazyGitToggle, 'Show LazyGit')
map('n', '<leader>so', ':SymbolsOutline<cr>', 'Show Outline')

-- Notifications
map('n', "<leader>na", function() noice.cmd("all") end, "Notifications: Show all")
map('n', "<leader>nl", function() noice.cmd("last") end, "Notifications: Show last")
map('n', "<leader>nh", function() notify.dismiss({ silent = true, pending = true }) end, "Notifications: Hide all")

-- Go To
map('n', '<leader>gd', lsp.definition, 'Go-to: Definition (under cursor)')
map('n', '<leader>gi', lsp.implementation, 'Go-to: Implementation (under cursor)')
map('n', '<leader>gt', nvimtree.tree.focus, 'Go-to: nvimTree')

-- Window
map('n', '<leader>wm', ':vertical resize +15<cr>', 'Window: Resize more (vertically)')
map('n', '<leader>wl', ':vertical resize -15<cr>', 'Window: Resize less (vertically)')
map('n', '<leader>wM', ':resize +10<cr>', 'Window: Resize more (horizontally)')
map('n', '<leader>wL', ':resize -10<cr>', 'Window: resize less (horizontally)')
map('n', '<leader>we', '<C-w>=', 'Window: resize evenly')

-- Reformat, Rename
map({ 'n', 'v' }, '<leader>rf', lsp.format, 'Re-format code')
map('n', '<leader>rn', lsp.rename, 'Re-name the string under cursor')
map('n', '<leader>rt', SetTabWidth, 'Re-size tab width')
