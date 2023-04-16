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
map({ 'n', 'v' }, 's', '"_s', 'Change character without yanking')

-- write and souce

local telescope = require('telescope.builtin')
local spectre = require("spectre")
local noice = require("noice")
local notify = require("notify")
local lsp = vim.lsp.buf


-- Buffers
map('n', '<leader>bd', ':bp<cr>:sp<cr>:bn<cr>:bd<cr>', 'Delete Buffer')
map('n', '<leader>bn', ':bn<cr>', 'Next Buffer')
map('n', '<Tab>', ':bn<cr>', 'Next Buffer')
map('n', '<leader>bp', ':bn<cr>', 'Previous Buffer')
map('n', '<S-Tab>', ':bp<cr>', 'Previous Buffer')
map('n', '<leader>br', ':bufdo e<cr>', 'Refresh Buffers')

-- Find
map('n', '<leader>ft', telescope.builtin, 'Find Telescope Pickers')
map('n', '<leader>ff', telescope.find_files, 'Find Files')
map('n', '<leader>fw', telescope.live_grep, 'Find Words')

map('n', '<leader>fb', telescope.buffers, 'Find Buffers')
map('n', '<leader>fm', telescope.marks, 'Find Marks')
map('n', '<leader>fc', telescope.commands, 'Find Commands')
map('n', '<leader>fk', telescope.keymaps, 'Find Keymaps')
map('n', '<leader>fh', telescope.help_tags, 'Find Help-tags')
map('n', "<leader>fr", function() spectre.open() end, "Find and Replace in Project")
map('v', "<leader>fr", function() spectre.open_visual({ select_word = true }) end, "Find and Replace in Project")
map({ 'n', 'v' }, '<leader>fs', telescope.grep_string, 'Find String under cursor')


-- Show
map('n', '<leader>su', telescope.lsp_references, 'Show Usages for string under cursor')
map('n', '<leader>ss', telescope.spell_suggest, 'Show Spelling suggestions')
map('n', '<leader>sd', function() telescope.diagnostics({ bufnr = 0 }) end, 'Show Diagnostics in the current buffer')
map('n', '<leader>se', vim.diagnostic.open_float, 'Show Errors for string under cursor')
map('n', '<leader>sa', lsp.code_action, 'Show Actions for string under cursor')
map('n', '<leader>sh', lsp.hover, 'Show Hover information for string under cursor')
map('n', '<leader>st', ':NvimTreeToggle<cr>', 'Show Tree (Toggle Nvim-Tree)')
map('n', '<leader>sg', function() LazyGitToggle() end, 'Show Git Status/Commits/Branches/Stashes')

-- Notifications
map('n', "<leader>na", function() noice.cmd("all") end, "Show all notifications")
map('n', "<leader>nl", function() noice.cmd("last") end, "Show last notification")
map('n', "<leader>nh", function() notify.dismiss({ silent = true, pending = true }) end, "Hide all notifications")

-- Go To
map('n', '<leader>gd', lsp.definition, 'Go to Definition of string under cursor')
map('n', '<leader>gi', lsp.implementation, 'Go to Implementation of string under cursor')
map('n', '<leader>gt', ':NvimTreeFocus<cr>', 'Go to NvimTree')

-- Window
map('n', '<leader>wm', ':vertical resize +15<cr>', 'Resize window more')
map('n', '<leader>wl', ':vertical resize -15<cr>', 'Resize window less')
map('n', '<leader>we', '<C-w>=', 'Resize window evenly')

-- Reformat, Rename
map({ 'n', 'v' }, '<leader>rf', lsp.format, 'Reformat code')
map('n', '<leader>rn', lsp.rename, 'Rename the string under cursor')
map('n', '<leader>rt',
  function()
    local width = tonumber(vim.fn.input("Tab Width: "))
    vim.opt.shiftwidth = width
    vim.opt.softtabstop = width
    vim.opt.tabstop = width
  end,
  'Reset Tab Size'
)
