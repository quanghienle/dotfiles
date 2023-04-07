local telescope_builtin = require('telescope.builtin')

local lazygit = require('toggleterm.terminal').Terminal:new({
  cmd = 'lazygit',
  hidden = true,
  direction = 'float'
})

  -- :help vim.keymap.set()
local function keymap(modes, lhs, rhs, description)
  vim.keymap.set(modes, lhs, rhs, { buffer = bufnr, remap = false, silent = true, desc = description })
end


keymap('n', '<esc>', ':noh<cr><esc>', 'Escape and Remove highlight')
keymap('n', '<leader>ws', ':w<cr>:source %<cr>:nohl<cr>', 'Write and source current file')

keymap('n', '<C-h>', '<C-w>h', 'Navigate to the Left pane')
keymap('n', '<C-j>', '<C-w>j', 'Navigate to the Bottom pane')
keymap('n', '<C-k>', '<C-w>k', 'Navigate to the Upper pane')
keymap('n', '<C-l>', '<C-w>l', 'Navigate to the Right pane')

keymap('x', 'K', ":move '<-2<cr>gv-gv", 'Move Visual Block up one line')
keymap('x', 'J', ":move '>+1<cr>gv-gv", 'Move Visual Block down one line')

keymap('v', '<', '<gv', 'Indent to the left')
keymap('v', '>', '>gv', 'Indent to the right')

keymap('n', 'G', 'Gzz', 'Go to bottom of file and center')
keymap('n', 'n', 'nzz', 'Go to next match and center')
keymap('n', 'N', 'Nzz', 'Go to previous match and center')


keymap('n', 'Y', 'y$', 'Yank to the end of line')
keymap('x', 'p', '\"_dP', 'Paste without yanking the visual text')

keymap('n', '<Tab>', ':bn<cr>', 'Go to the next buffer')
keymap('n', '<S-Tab>', ':bp<cr>', 'Go to the previous buffer')

keymap('n', '<leader>db', ':bp<cr>:sp<cr>:bn<cr>:bd<cr>', 'Delete current buffer')

-- Don't yank on delete char
keymap({ 'n', 'v' }, 'x', '"_x', 'Delete character without yanking')
keymap({ 'n', 'v' }, 'X', '"_X', 'Delete character without yanking')
keymap({ 'n', 'v' }, 's', '"_s', 'Change character without yanking')

-- write and souce


keymap('n', '<leader>fp', telescope_builtin.builtin, 'Find Pickers (Telescope built-in functions)')
keymap('n', '<leader>ff', telescope_builtin.find_files, 'Find Files')
keymap('n', '<leader>fw', telescope_builtin.live_grep, 'Find Words')
keymap({ 'n', 'v' }, '<leader>fs', telescope_builtin.grep_string, 'Find String under cursor (normal and visual)')
keymap('n', '<leader>fb', telescope_builtin.buffers, 'Find Buffers')
keymap('n', '<leader>fm', telescope_builtin.marks, 'Find Marks')
keymap('n', '<leader>fc', telescope_builtin.commands, 'Find Commands')
keymap('n', '<leader>fk', telescope_builtin.keymaps, 'Find Keymaps')
keymap('n', '<leader>fh', telescope_builtin.help_tags, 'Find Help-tags')

keymap('n', '<leader>su', telescope_builtin.lsp_references, 'Show Usages for current word under cursor')
keymap('n', '<leader>ss', telescope_builtin.lsp_document_symbols, 'Show Symbols in the current buffer')
keymap('n', '<leader>sd', telescope_builtin.diagnostics, 'Show Diagnostics in the current buffer')
keymap('n', '<leader>se', vim.diagnostic.open_float, 'Show Errors for current word under cursor')
keymap('n', '<leader>sa', vim.lsp.buf.code_action, 'Show Actions for current word under cursor')
keymap('n', '<leader>sh', vim.lsp.buf.hover, 'Show Hover information for current word under cursor')
keymap('n', '<leader>st', ':NvimTreeToggle<cr>', 'Show Tree (Toggle Nvim-Tree)')
keymap('n', '<leader>sg', function() lazygit:toggle() end, 'Show Git Status/Commits/Branches/Stashes')

keymap('n', '<leader>gd', vim.lsp.buf.definition, 'Go to Definition of the word under cursor')
keymap('n', '<leader>gi', vim.lsp.buf.implementation, 'Go to Implementation of the word under cursor')

keymap('n', '<leader>rn', vim.lsp.buf.rename, 'Rename the word under cursor')
keymap({ 'n', 'v' }, '<leader>rf', vim.lsp.buf.format, 'Reformat code (normal and visual)')
keymap({ 'n', 'v' }, '<leader>rs', ':vertical resize ', 'Resize window')
keymap({ 'n', 'v' }, '<leader>r+', ':vertical resize +20<cr>', 'Resize window')
keymap({ 'n', 'v' }, '<leader>r-', ':vertical resize -20<cr>', 'Resize window')
keymap({ 'n', 'v' }, '<leader>r=', '<C-w>=', 'Resize window')
