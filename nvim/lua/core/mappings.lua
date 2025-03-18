local utils = require("core.utils")

local wk = require("which-key")
vim.opt.timeoutlen = 200
wk.setup({
  plugins = {
    marks = true,     -- shows a list of your marks on " and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = { enabled = false }
  },
  layout = {
    height = { min = 4, max = 20 }, -- min and max height of the columns
    spacing = 10,                   -- spacing between columns
  },
  win = { border = "single" },
  spec = {
    { "<esc>",     "<cmd>noh<cr><esc>", desc = "Escape and Remove highlight", mode = { "n", "i" } },
    {
      mode = "n",
      { "<C-h>", "<C-w>h", desc = "Navigate to the Left pane" },
      { "<C-j>", "<C-w>j", desc = "Navigate to the Bottom pane" },
      { "<C-k>", "<C-w>k", desc = "Navigate to the Upper pane" },
      { "<C-l>", "<C-w>l", desc = "Navigate to the Right pane" },
      { "G",     "Gzz",    desc = "Go to bottom of file and center" },
      { "n",     "nzz",    desc = "Go to next match and center" },
      { "N",     "Nzz",    desc = "Go to previous match and center" },
      { "Y",     "y$",     desc = "Yank to the end of line" },
    },
    {
      mode = "x",
      { "J", ":move '>+1<cr>gv-gv", desc = "Move Visual Block down one line" },
      { "K", ":move '<-2<cr>gv-gv", desc = "Move Visual Block up one line" },
      { "p", "\"_dP",               desc = "Paste without yanking" },
    },
    {
      mode = "v",
      { "<", "<gv", desc = "Indent to the left" },
      { ">", ">gv", desc = "Indent to the right" },
    },

    -- Don't yank on delete char
    {
      mode = { "n", "v" },
      { "x", "\"_x", desc = "Delete char without yanking" },
      { "X", "\"_X", desc = "Delete char without yanking" },
      { "s", "\"_s", desc = "Delete char without yanking" },
      { "c", "\"_c", desc = "Change char without yanking" },
      { "C", "\"_C", desc = "Change char without yanking" },
    },

    -- show/select
    { "<leader>s", group = " [S]how" },
    {
      mode = "n",
      { "<leader>su", ":Telescope lsp_references<cr>",           desc = "[S]how [U]sages" },
      { "<leader>sm", ":Telescope spell_suggest<cr>",            desc = "[S]how [S]pelling" },
      { "<leader>se", vim.diagnostic.open_float,                 desc = "[S]how [E]rrors" },
      { "<leader>sa", require("actions-preview").code_actions,   desc = "[S]how [A]ctions", },
      { "<leader>sd", utils.current_diagnostics,                 desc = "[S]how [D]iagnostics (buffer)" },
      { "<leader>si", utils.show_popup_info,                     desc = "[S]how [I]nformation" },
      { "<leader>sf", ":lua MiniFiles.open()<cr>",               desc = "[S]how [F]ile Explorer" },
      { "<leader>st", require("nvim-tree.api").tree.toggle,      desc = "[S]how File[T]ree" },
      { "<leader>so", ":SymbolsOutline<cr>",                     desc = "[S]how [O]utline" },
      { "<leader>sz", ":ZenMode<cr>",                            desc = "[S]how [Z]en Mode" },
      { "<leader>sg", ":LazyGit<cr>",                            desc = "[S]how [G]it" },
      { "<leader>sb", ":Gitsigns blame_line<cr>",                desc = "[S]how [B]lame" },
      { "<leader>sh", ":AdvancedGitSearch diff_commit_file<cr>", desc = "[S]how [H]istory (file)" },
      { "<leader>sh", ":AdvancedGitSearch diff_commit_line<cr>", desc = "[S]how [H]istory (visual)" },
      { "<leader>sn", ":NoiceTelescope<cr>",                     desc = "[S]how [N]otifications" },
    },

    -- Comment
    { "<leader>c",  group = " [C]omment" },
    { "<leader>cb", group = " [C]omment [B]ox" },
    {
      mode = { "n", "v" },
      { "<leader>cbl", ":CBllbox<cr>",   desc = "[C]omment [B]ox: [L]eft align" },
      { "<leader>cbc", ":CBlcbox<cr>",   desc = "[C]omment [B]ox: [C]enter align" },
      { "<leader>cba", ":CBcatalog<cr>", desc = "[C]omment [B]ox: [A]ll styles" },
    },

    -- find/search
    { "<leader>f", group = " [F]ind" },
    {
      mode = "n",
      { "<leader>fs", ":SessionSearch<cr>",        desc = "[F]ind [S]ession" },
      { "<leader>ff", ":Telescope find_files<cr>", desc = "[F]ind [F]ile" },
      { "<leader>ft", ":Telescope builtin<cr>",    desc = "[F]ind [T]elescope Pickers" },
      { "<leader>fw", ":Telescope live_grep<cr>",  desc = "[F]ind [W]ord (live grep)" },
      { "<leader>fm", ":Telescope marks<cr>",      desc = "[F]ind [M]arks" },
      { "<leader>fb", ":Telescope buffers<cr>",    desc = "[F]ind [B]uffers", },
      { "<leader>fh", ":Telescope help_tags<cr>",  desc = "[F]ind [H]elp-tags" },
      { "<leader>fr", ":Telescope resume<cr>",     desc = "[F]ind [R]esume last search" },
      { "<leader>fp", utils.find_in_path,          desc = "[F]ind in [P]ath (live grep)" },
      { "<leader>fn", ":Telekasten<cr>",           desc = "[F]ind [N]otes" },
      { "<leader>fc", utils.live_grep_cursor,      desc = "[F]ind [C]ursor word (live grep)", mode = { "n", "v" } },
    },

    -- Go To
    { "<leader>g", group = " [G]oTo" },
    {
      mode = "n",
      { "<leader>gd", ":Telescope lsp_definitions<cr>",     desc = "[G]oTo [D]efinition" },
      { "<leader>gi", ":Telescope lsp_implementations<cr>", desc = "[G]oTo [I]mplementation" },
      { "<leader>gt", utils.nvimtree_current,               desc = "[G]oTo File[T]ree" },
      { "<leader>gf", utils.minifiles_current,              desc = "[G]oTo [F]ile Explorer" },
    },

    -- Buffers
    { "<leader>b", group = " [B]uffer" },
    {
      mode = "n",
      { "<leader>bd", ":bp|bd #<cr>",        desc = "[B]uffer [D]elete" },
      { "<leader>bn", ":bn<cr>",             desc = "[B]uffer [N]ext" },
      { "<leader>bp", ":bp<cr>",             desc = "[B]uffer [P]revious" },
      { "<leader>bc", ":%bd|e#|bd#<cr>|'\"", desc = "[B]ufder [C]lear" },
      { "<Tab>",      ":bn<cr>",             desc = "[B]uffer [N]ext" },
      { "<S-Tab>",    ":bp<cr>",             desc = "[B]uffer [P]revious" },
    },

    -- Window
    { "<leader>w", group = " [W]indow" },
    {
      mode = "n",
      { "<leader>wV", ":vertical resize +15<cr>", desc = "[W]indow [V]ertically increase" },
      { "<leader>wv", ":vertical resize -15<cr>", desc = "[W]indow [v]ertically decrease" },
      { "<leader>wH", ":resize +10<cr>",          desc = "[W]indow [H]orizontally increase" },
      { "<leader>wh", ":resize -10<cr>",          desc = "[W]indow [h]orizontally decrease" },
      { "<leader>we", "<C-w>=",                   desc = "[W]indow [E]venly resize" },
      { "<leader>wd", "<C-w>c",                   desc = "[W]indow [D]elete" },
      { "<C->>",      ":vertical resize +15<cr>", desc = "[W]indow [V]ertically increase" },
      { "<C-<>",      ":vertical resize -15<cr>", desc = "[W]indow [v]ertically decrease" },
    },

    -- Tabs
    { "<leader>t", group = " [T]ab" },
    {
      mode = "n",
      { "<leader>tn", ":tabnext<cr>",     desc = "[T]ab: [N]ext" },
      { "<leader>tp", ":tabprevious<cr>", desc = "[T]ab: [P]revious" },
      { "<leader>td", ":tabclose<cr>",    desc = "[T]ab: [D]elete" },
      { "<leader>tt", ":tabnew<cr>",      desc = "[T]ab: new [T]ab" },
    },

    -- Actions/AI
    { "<leader>a", group = " [A]ction/AI" },
    {
      mode = "n",
      { "<leader>ar", vim.lsp.buf.rename,        desc = "[A]ction [R]ename" },
      { "<leader>at", utils.set_tabwidth,        desc = "[A]ction [T]ab-width" },
      { "<leader>ad", utils.clear_notifications, desc = "[A]ction [D]ismiss notifications" },
    },
    {
      mode = { "n", "v" },
      { "<leader>af", vim.lsp.buf.format,        desc = "[A]ction [F]ormat code" },
      { "<leader>ai", ":CopilotChatToggle<cr>",  desc = "[A]I Toggle" },
      { "<leader>ap", ":CopilotChatPrompts<cr>", desc = "[A]I [P]rompts" },
      { "<leader>ac", ":CopilotChatReset<cr>",   desc = "[A]I [C]lear" },
      { "<leader>as", ":CopilotChatStop<cr>",    desc = "[A]I [S]top" },
      { "<leader>aq", utils.ai_question,         desc = "[A]ction [T]ab-width" },
    },
  }
})
