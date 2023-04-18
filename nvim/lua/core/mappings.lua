function FindInPath()
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

function ShowPopupInfo()
  if vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), "filetype") == "NvimTree" then
    require("nvim-tree.api").node.show_info_popup()
  else
    vim.lsp.buf.hover()
  end
end

function SetTabWidth()
  local function callback(input)
    local width = tonumber(input)
    vim.opt.shiftwidth = width
    vim.opt.softtabstop = width
    vim.opt.tabstop = width
  end
  vim.ui.input({ prompt = "Enter value for shiftwidth" }, callback)
end

function LazyGitToggle()
  local lazygit = require("toggleterm.terminal").Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float"
  })

  lazygit:toggle()
end

-- :help vim.keymap.set()
local function map(modes, lhs, rhs, description)
  vim.keymap.set(modes, lhs, rhs, { remap = false, silent = true, desc = description })
end

map({"n", "i"}, "<esc>", "<cmd>noh<cr><esc>", "Escape and Remove highlight")

map("n", "<C-h>", "<C-w>h", "Navigate to the Left pane")
map("n", "<C-j>", "<C-w>j", "Navigate to the Bottom pane")
map("n", "<C-k>", "<C-w>k", "Navigate to the Upper pane")
map("n", "<C-l>", "<C-w>l", "Navigate to the Right pane")
map("x", "K", ":move '<-2<cr>gv-gv", "Move Visual Block up one line")
map("x", "J", ":move '>+1<cr>gv-gv", "Move Visual Block down one line")

map("v", "<", "<gv", "Indent to the left")
map("v", ">", ">gv", "Indent to the right")

map("n", "G", "Gzz", "Go to bottom of file and center")
map("n", "n", "nzz", "Go to next match and center")
map("n", "N", "Nzz", "Go to previous match and center")

map("n", "Y", "y$", "Yank to the end of line")
map("x", "p", "\"_dP", "Paste without yanking the visual text")


-- Don"t yank on delete char
map({ "n", "v" }, "x", "\"_x", "Delete character without yanking")
map({ "n", "v" }, "X", "\"_X", "Delete character without yanking")
map({ "n", "v" }, "c", "\"_c", "Delete character without yanking")
map({ "n", "v" }, "C", "\"_C", "Delete character without yanking")
map({ "n", "v" }, "s", "\"_s", "Change character without yanking")


-- Buffers
map("n", "<leader>bd", ":bp<cr>:sp<cr>:bn<cr>:bd<cr>", "Buffer: Delete")
map("n", "<leader>bn", ":bn<cr>", "Buffer: Next")
map("n", "<leader>bp", ":bp<cr>", "Buffer: Previous")
map("n", "<leader>br", ":bufdo e<cr>", "Buffer: Refresh")

-- Buffer number: <leader>1..9 to jump to buffer
for i = 1, 9, 1 do
  map("n", "<leader>" .. i, function() require("bufferline").go_to_buffer(i) end, "Go to buffer " .. i)
end

map("n", "<Tab>", ":bn<cr>", "Next Buffer")
map("n", "<S-Tab>", ":bp<cr>", "Previous Buffer")

-- Find
map("n", "<leader>ft", require("telescope.builtin").builtin, "Find Telescope Pickers")
map("n", "<leader>ff", require("telescope.builtin").find_files, "Find Files")
map("n", "<leader>fw", require("telescope.builtin").live_grep, "Find Word (Live Grep)")
map("n", "<leader>fm", require("telescope.builtin").marks, "Find Marks")
map("n", "<leader>fc", require("telescope.builtin").commands, "Find Commands")
map("n", "<leader>fb", require("telescope.builtin").buffers, "Find Commands")
map("n", "<leader>fh", require("telescope.builtin").help_tags, "Find Help-tags")
map("n", "<leader>fr", require("spectre").open, "Find and Replace in Project")
map("n", "<leader>fp", FindInPath, "Find in Path (Live Grep)")

-- Show
map("n", "<leader>sw", require("telescope.builtin").grep_string, "Show Word occurences (under cursor)")
map("v", "<leader>sw", require("telescope.builtin").grep_string, "Show Word occurences (under cursor)")
map("n", "<leader>su", require("telescope.builtin").lsp_references, "Show Usages (under cursor)")
map("n", "<leader>ss", require("telescope.builtin").spell_suggest, "Show Spelling suggestions (under cursor)")
map("n", "<leader>se", vim.diagnostic.open_float, "Show Errors (under cursor)")
map("n", "<leader>sa", vim.lsp.buf.code_action, "Show code-Actions (under cursor)")
map("n", "<leader>sd",
  function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end,
  "Show Diagnostics (current buffer)"
)
map("n", "<leader>si", ShowPopupInfo, "Show Information (under cursor)")
map("n", "<leader>st", require("nvim-tree.api").tree.toggle, "Show NvimTree")
map("n", "<leader>sg", LazyGitToggle, "Show LazyGit")
map("n", "<leader>so", ":SymbolsOutline<cr>", "Show Outline")

-- Notifications
map("n", "<leader>na", ":NoiceTelescope<cr>", "Notifications: Show all")
map("n", "<leader>nl", ":NoiceLast<cr>", "Notifications: Show last")
map("n", "<leader>nh",
  function() require("notify").dismiss({ silent = true, pending = true }) end,
  "Notifications: Hide all"
)

-- Go To
map("n", "<leader>gd", vim.lsp.buf.definition, "Go-to: Definition (under cursor)")
map("n", "<leader>gi", vim.lsp.buf.implementation, "Go-to: Implementation (under cursor)")
map("n", "<leader>gt", require("nvim-tree.api").tree.focus, "Go-to: nvimTree")

-- Window
map("n", "<leader>w>", ":vertical resize +15<cr>", "Window: Increase vertically")
map("n", "<leader>w<", ":vertical resize -15<cr>", "Window: Descrease vertically")
map("n", "<leader>w+", ":resize +10<cr>", "Window: Increase horizontally")
map("n", "<leader>w-", ":resize -10<cr>", "Window: Decrease horizontally")
map("n", "<leader>we", "<C-w>=", "Window: Resize evenly")
map("n", "<leader>wd", "<C-w>c", "Window: Delete")

-- Reformat, Rename
map({ "n", "v" }, "<leader>rf", vim.lsp.buf.format, "Reformat code")
map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol under cursor")
map("n", "<leader>rt", SetTabWidth, "Reset tab width")
map("n", "<leader>rs", require("session_manager").load_current_dir_session, "Restore Session")
