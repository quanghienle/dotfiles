
-- GoTo code navigation.
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", { noremap = false, silent = true })

-- Formatting selected code.
vim.api.nvim_set_keymap("n", "<leader>cf", "<Plug>(coc-format-selected)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("x", "<leader>cf", "<Plug>(coc-format-selected)", { noremap = false, silent = true })

