-- :help vim.keymap.set()
local function map(modes, lhs, rhs, description)
  vim.keymap.set(modes, lhs, rhs, { remap = false, silent = true, desc = description })
end

local ni = { "n", "i" }
local nv = { "n", "v" }

map(ni, "<esc>", "<cmd>noh<cr><esc>", "Escape and Remove highlight")

map("n", "<C-h>", "<C-w>h", "Navigate to the Left pane")
map("n", "<C-j>", "<C-w>j", "Navigate to the Bottom pane")
map("n", "<C-k>", "<C-w>k", "Navigate to the Upper pane")
map("n", "<C-l>", "<C-w>l", "Navigate to the Right pane")
map("x", "J", ":move '>+1<cr>gv-gv", "Move Visual Block down one line")
map("x", "K", ":move '<-2<cr>gv-gv", "Move Visual Block up one line")

map("v", "<", "<gv", "Indent to the left")
map("v", ">", ">gv", "Indent to the right")

map("n", "G", "Gzz", "Go to bottom of file and center")
map("n", "n", "nzz", "Go to next match and center")
map("n", "N", "Nzz", "Go to previous match and center")

map("n", "Y", "y$", "Yank to the end of line")
map("x", "p", "\"_dP", "Paste without yanking the visual text")


-- Don't yank on delete char
map(nv, "x", "\"_x", "Delete character without yanking")
map(nv, "X", "\"_X", "Delete character without yanking")
map(nv, "c", "\"_c", "Delete character without yanking")
map(nv, "C", "\"_C", "Delete character without yanking")
map(nv, "s", "\"_s", "Change character without yanking")


-- Tabs
map("n", "<leader>tn", ":tabnext<cr>", "Tab: Next")
map("n", "<leader>tp", ":tabprevious<cr>", "Tab: Previous")

-- Buffers
map("n", "<leader>bd", ":bp<cr>:sp<cr>:bn<cr>:bd<cr>", "[B]uffer: [D]elete")
map("n", "<leader>bn", ":bn<cr>", "[B]uffer: [N]ext")
map("n", "<leader>bp", ":bp<cr>", "[B]uffer: [P]revious")
map("n", "<leader>bb", require("telescope.builtin").buffers, "[B]uffer: [L]ist")
map("n", "<Tab>", ":bn<cr>", "Next Buffer")
map("n", "<S-Tab>", ":bp<cr>", "Previous Buffer")

-- Find
map(nv, "<leader>ft", require("telescope.builtin").builtin, "[F]ind [T]elescope pickers")
map("n", "<leader>ff", require("telescope.builtin").find_files, "[F]ind [F]iles")
map("n", "<leader>fw", require("telescope.builtin").live_grep, "[F]ind [W]ord (live grep)")
map(nv, "<leader>fc", require("core.utils").live_grep_cursor, "[F]ind [C]ursor word (live grep)")
map("n", "<leader>fm", require("telescope.builtin").marks, "[F]ind [M]arks")
map("n", "<leader>fb", require("telescope.builtin").buffers, "[F]ind [B]uffers")
map("n", "<leader>fh", require("telescope.builtin").help_tags, "[F]ind [H]elp-tags")
map("n", "<leader>fr", require("spectre").open, "[F]ind and [R]eplace in Project")
map("n", "<leader>fp", require("core.utils").find_in_path, "[F]ind in [P]ath (live grep)")
map("n", "<leader>fn", ":Telekasten<cr>", "[F]ind [N]otes")

-- Show
--map("n", "<leader>sa", vim.lsp.buf.code_action, "Show code-Actions (under cursor)")
--map("n", "<leader>sb", require("core.utils").toggle_bufferline, "Show/Toggle Bufferline")
map("n", "<leader>su", require("telescope.builtin").lsp_references, "[S]how [U]sages (under cursor)")
map("n", "<leader>ss", require("telescope.builtin").spell_suggest, "[S]how [S]pelling suggestions (under cursor)")
map("n", "<leader>se", vim.diagnostic.open_float, "[S]how [E]rrors (under cursor)")
map("n", "<leader>sa", require("actions-preview").code_actions, "[S]how code-[A]ctions (under cursor)")
map("n", "<leader>sd", function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end, "[S]how [D]iagnostics (current buffer)")
map("n", "<leader>si", require("core.utils").show_popup_info, "[S]how [I]nformation (under cursor)")
map("n", "<leader>st", require("nvim-tree.api").tree.toggle, "[S]how/toggle File [T]ree")
map("n", "<leader>so", ":SymbolsOutline<cr>", "[S]how/toggle [O]utline")
map("n", "<leader>sf", ":ZenMode<cr>", "[S]how/toggle [F]ocus Mode")
map("n", "<leader>sg", ":LazyGit<cr>", "[S]how [G]it")
map("n", "<leader>sh", ":AdvancedGitSearch diff_commit_file<cr>", "[S]how Git [H]istory for file")
map("v", "<leader>sh", ":AdvancedGitSearch diff_commit_line<cr>", "[S]how Git [H]istory for lines")


-- Marks
map("n", "<leader>ma", require('harpoon.mark').add_file, "[M]arks: [A]dd")
--map("n", "<leader>ms", require('harpoon.ui').toggle_quick_menu, "Marks: Show Marks")
map("n", "<leader>mm", function ()
  require('telescope').extensions.harpoon.marks({ initial_mode = "normal" })
end, "[M]arks: show [M]arks")
map("n", "<leader>mn", require('harpoon.ui').nav_next, "[M]arks: [N]ext mark")
map("n", "<leader>mp", require('harpoon.ui').nav_prev, "[M]arks: [P]rev mark")

-- Notifications
map("n", "<leader>nn", ":NoiceTelescope<cr>", "[N]otifications: show all [N]otifications")
map("n", "<leader>nd", function() require("notify").dismiss({ silent = true, pending = true }) end, "[N]otifications: [D]ismiss all")

-- Go To
--map("n", "<leader>gd", function() vim.lsp.buf.definition({ reuse_win = true }) end, "[G]oTo: [D]efinition (under cursor)")
--map("n", "<leader>gi", vim.lsp.buf.implementation, "[G]oTo: [I]mplementation (under cursor)")
map("n", "<leader>gd", require("telescope.builtin").lsp_definitions, "[G]oTo: [D]efinition (under cursor)")
map("n", "<leader>gi", require("telescope.builtin").lsp_implementations, "[G]oTo: [I]mplementation (under cursor)")
map("n", "<leader>gt", require("nvim-tree.api").tree.focus, "[G]oTo: file [T]ree")


map(nv, "<leader>cbl", ":CBllbox<cr>", "[C]omment-[B]ox: align [L]eft")
map(nv, "<leader>cbc", ":CBlcbox<cr>", "[C]omment-[B]ox: align [C]enter")
map(nv, "<leader>cba", ":CBcatalog<cr>", "[C]omment-[B]ox: [A]ll styles")

-- Window
map("n", "<C->>", ":vertical resize +15<cr>", "Window: Increase vertically")
map("n", "<C-<>", ":vertical resize -15<cr>", "Window: Descrease vertically")
map("n", "<leader>w>", ":vertical resize +15<cr>", "Window: Increase vertically")
map("n", "<leader>w<", ":vertical resize -15<cr>", "Window: Descrease vertically")
map("n", "<leader>w+", ":resize +10<cr>", "Window: Increase horizontally")
map("n", "<leader>w-", ":resize -10<cr>", "Window: Decrease horizontally")
map("n", "<leader>we", "<C-w>=", "Window: Resize evenly")
map("n", "<leader>wd", "<C-w>c", "Window: Delete")

-- Reformat, Rename
map(nv, "<leader>af", vim.lsp.buf.format, "[A]ction: [F]ormat code")
map("n", "<leader>ar", vim.lsp.buf.rename, "[A]ction: [R]ename symbol under cursor")
map("n", "<leader>at", require("core.utils").set_tabwidth, "[A]ction: [T]ab-width")
map("n", "<leader>as", require("session_manager").load_current_dir_session, "[A]ction: [S]ession restore")
