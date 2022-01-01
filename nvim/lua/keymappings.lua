local opt = { noremap = true, silent = true }

-- Better window movement
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opt)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opt)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opt)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opt)


-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", opt)
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", opt)

-- Keep visual mode indenting
vim.api.nvim_set_keymap("v", "<", "<gv", opt)
vim.api.nvim_set_keymap("v", ">", ">gv", opt)

-- keep center
vim.api.nvim_set_keymap("n", "G", "Gzz", opt)
vim.api.nvim_set_keymap("n", "n", "nzz", opt)
vim.api.nvim_set_keymap("n", "N", "Nzz", opt)

-- set no-highlight when escaping
vim.api.nvim_set_keymap("n", "<esc>", ":noh<return><esc>", opt)

-- set yank and paste
vim.api.nvim_set_keymap("n", "Y", "y$", opt)
vim.api.nvim_set_keymap("x", "<leader>y", "\"+y", opt)
vim.api.nvim_set_keymap("x", "p", "\"_dP", opt)

-- Buffers
vim.api.nvim_set_keymap("n", "<Tab>", ":bn<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>bn", ":bn<CR>", opt)
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bp<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>bp", ":bp<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>bd", ":bp<CR>:sp<CR>:bn<CR>:bd<CR>", opt)

-- Don't yank on delete char
vim.api.nvim_set_keymap("n", "x", '"_x', opt)
vim.api.nvim_set_keymap("n", "X", '"_X', opt)
vim.api.nvim_set_keymap("v", "x", '"_x', opt)
vim.api.nvim_set_keymap("v", "X", '"_X', opt)

-- write and souce
vim.api.nvim_set_keymap("n", "<leader>ws", ":w<CR>:source %<CR>:nohl<CR>", opt)


---- GoTo code navigation.
--vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", opt)
--vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)", opt)
--vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", opt)
--vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", opt)

---- Formatting selected code.
--vim.api.nvim_set_keymap("n", "<leader>cf", "<Plug>(coc-format-selected)", opt)
--vim.api.nvim_set_keymap("x", "<leader>cf", "<Plug>(coc-format-selected)", opt)
