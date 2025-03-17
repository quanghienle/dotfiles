-- { key, description, command, modes }
local mappings = {
  { "<esc>", "Escape and Remove highlight",           "<cmd>noh<cr><esc>",   { "n", "i" } },

  { "<C-h>", "Navigate to the Left pane",             "<C-w>h",              "n" },
  { "<C-j>", "Navigate to the Bottom pane",           "<C-w>j",              "n" },
  { "<C-k>", "Navigate to the Upper pane",            "<C-w>k",              "n" },
  { "<C-l>", "Navigate to the Right pane",            "<C-w>l",              "n" },
  { "J",     "Move Visual Block down one line",       ":move '>+1<cr>gv-gv", "x" },
  { "K",     "Move Visual Block up one line",         ":move '<-2<cr>gv-gv", "x" },

  { "<",     "Indent to the left",                    "<gv",                 "v" },
  { ">",     "Indent to the right",                   ">gv",                 "v" },

  { "G",     "Go to bottom of file and center",       "Gzz",                 "n" },
  { "n",     "Go to next match and center",           "nzz",                 "n" },
  { "N",     "Go to previous match and center",       "Nzz",                 "n" },

  { "Y",     "Yank to the end of line",               "y$",                  "n" },
  { "p",     "Paste without yanking the visual text", "\"_dP",               "x" },

  -- Don't yank on delete char
  { "x",     "Delete character without yanking",      "\"_x",                { "n", "v" } },
  { "X",     "Delete character without yanking",      "\"_X",                { "n", "v" } },
  { "s",     "Delete character without yanking",      "\"_s",                { "n", "v" } },
  { "c",     "Change character without yanking",      "\"_c",                { "n", "v" } },
  { "C",     "Change character without yanking",      "\"_C",                { "n", "v" } },
}

for _, mapping in ipairs(mappings) do
  -- :help vim.keymap.set()
  vim.keymap.set(mapping[4], mapping[1], mapping[3], { remap = false, silent = true, desc = mapping[2] })
end

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
    align = "center",               -- align columns left, center or right
  },
  win = { border = "single" }
})

wk.add(
  {
    -- Copilot Prompt
    { "<leader>p",   group = " Copilot [P]rompt" },
    { "<leader>pt",  "<cmd>CopilotChatToggle<cr>",                                                desc = "Copilot [P]rompt [T]oggle",              mode = { "n", "v" } },
    { "<leader>pa",  "<cmd>CopilotChatPrompts<cr>",                                               desc = "Copilot [P]rompt [A]ctions",             mode = { "n", "v" } },
    { "<leader>pr",  "<cmd>CopilotChatReset<cr>",                                                 desc = "Copilot [P]rompt [R]eset",               mode = { "n", "v" } },
    { "<leader>ps",  "<cmd>CopilotChatStop<cr>",                                                  desc = "Copilot [P]rompt [S]top generating",     mode = { "n", "v" } },

    -- show/select
    { "<leader>s",   group = " [S]how" },
    { "<leader>su",  "<cmd>Telescope lsp_references<cr>",                                         desc = "[S]how [U]sages (cursor)",               mode = "n" },
    { "<leader>sm",  "<cmd>Telescope spell_suggest<cr>",                                          desc = "[S]how [S]pelling suggestions (cursor)", mode = "n" },
    { "<leader>se",  vim.diagnostic.open_float,                                                   desc = "[S]how [E]rrors (cursor)",               mode = "n" },
    { "<leader>sa",  require("actions-preview").code_actions,                                     desc = "[S]how [A]ctions (cursor)",              mode = "n" },
    { "<leader>sd",  function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end,      desc = "[S]how [D]iagnostics (buffer)",          mode = "n" },
    { "<leader>si",  require("core.utils").show_popup_info,                                       desc = "[S]how [I]nformation (cursor)",          mode = "n" },
    { "<leader>sf",  "<cmd>lua MiniFiles.open()<cr>",                                             desc = "[S]how [F]ile Explorer",                 mode = "n" },
    { "<leader>st",  require("nvim-tree.api").tree.toggle,                                        desc = "[S]how File[T]ree",                      mode = "n" },
    { "<leader>so",  "<cmd>SymbolsOutline<cr>",                                                   desc = "[S]how [O]utline",                       mode = "n" },
    { "<leader>sz",  "<cmd>ZenMode<cr>",                                                          desc = "[S]how [Z]en Mode",                      mode = "n" },
    { "<leader>sg",  "<cmd>LazyGit<cr>",                                                          desc = "[S]how [G]it",                           mode = "n" },
    { "<leader>sb",  "<cmd>Gitsigns blame_line<cr>",                                              desc = "[S]how [B]lame",                         mode = "n" },
    { "<leader>sh",  "<cmd>AdvancedGitSearch diff_commit_file<cr>",                               desc = "[S]how [H]istory (file)",                mode = "n" },
    { "<leader>sh",  "<cmd>AdvancedGitSearch diff_commit_line<cr>",                               desc = "[S]how [H]istory (visual)",              mode = "v" },
    { "<leader>sn",  "<cmd>NoiceTelescope<cr>",                                                   desc = "[S]how [N]otifications",                 mode = "n" },

    -- Comment Box
    { "<leader>c",   group = " [C]omment" },
    { "<leader>cbl", "<cmd>CBllbox<cr>",                                                          desc = "[C]omment [B]ox: [L]eft align",          mode = { "n", "v" } },
    { "<leader>cbc", "<cmd>CBlcbox<cr>",                                                          desc = "[C]omment [B]ox: [C]enter align",        mode = { "n", "v" } },
    { "<leader>cba", "<cmd>CBcatalog<cr>",                                                        desc = "[C]omment [B]ox: [A]ll styles",          mode = { "n", "v" } },

    -- find/search
    { "<leader>f",   group = " [F]ind" },
    { "<leader>fs",  "<cmd>SessionSearch<cr>",                                                    desc = "[F]ind [S]ession",                       mode = "n" },
    { "<leader>ff",  "<cmd>Telescope find_files<cr>",                                             desc = "[F]ind [F]ile",                          mode = "n" },
    { "<leader>ft",  "<cmd>Telescope builtin<cr>",                                                desc = "[F]ind [T]elescope Pickers",             mode = "n" },
    { "<leader>fw",  "<cmd>Telescope live_grep<cr>",                                              desc = "[F]ind [W]ord (live grep)",              mode = "n" },
    { "<leader>fc",  require("core.utils").live_grep_cursor,                                      desc = "[F]ind [C]ursor word (live grep)",       mode = { "n", "v" } },
    { "<leader>fm",  "<cmd>Telescope marks<cr>",                                                  desc = "[F]ind [M]arks",                         mode = "n" },
    { "<leader>fb",  "<cmd>Telescope buffers<cr>",                                                desc = "[F]ind [B]uffers",                       mode = "n" },
    { "<leader>fh",  "<cmd>Telescope help_tags<cr>",                                              desc = "[F]ind [H]elp-tags",                     mode = "n" },
    { "<leader>fr",  "<cmd>Telescope resume<cr>",                                                 desc = "[F]ind [R]esume last search",            mode = "n" },
    { "<leader>fp",  require("core.utils").find_in_path,                                          desc = "[F]ind in [P]ath (live grep)",           mode = "n" },
    { "<leader>fn",  "<cmd>Telekasten<cr>",                                                       desc = "[F]ind [N]otes",                         mode = "n" },

    -- Go To
    { "<leader>g",   group = " [G]oTo" },
    { "<leader>gd",  "<cmd>Telescope lsp_definitions<cr>",                                        desc = "[G]oTo [D]efinition",                    mode = "n" },
    { "<leader>gi",  "<cmd>Telescope lsp_implementations<cr>",                                    desc = "[G]oTo [I]mplementation",                mode = "n" },
    { "<leader>gt",  function() require("nvim-tree.api").tree.open({ find_file = true }) end,     desc = "[G]oTo File[T]ree",                      mode = "n" },
    { "<leader>gf",  "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>",                 desc = "[G]oTo [F]ile Explorer",                 mode = "n" },

    -- Buffers
    { "<leader>b",   group = " [B]uffer" },
    { "<leader>bd",  "<cmd>bp|bd #<cr>",                                                          desc = "[B]uffer [D]elete",                      mode = "n" },
    { "<leader>bn",  "<cmd>bn<cr>",                                                               desc = "[B]uffer [N]ext",                        mode = "n" },
    { "<leader>bp",  "<cmd>bp<cr>",                                                               desc = "[B]uffer [P]revious",                    mode = "n" },
    { "<leader>bc",  "<cmd>%bd|e#|bd#<cr>|'\"",                                                   desc = "[B]ufder [C]lear",                       mode = "n" },
    { "<Tab>",       "<cmd>bn<cr>",                                                               desc = "[B]uffer [N]ext",                        mode = "n" },
    { "<S-Tab>",     "<cmd>bp<cr>",                                                               desc = "[B]uffer [P]revious",                    mode = "n" },

    -- Window
    { "<leader>w",   group = " [W]indow" },
    { "<leader>wV",  "<cmd>vertical resize +15<cr>",                                              desc = "[W]indow [V]ertically increase",         mode = "n" },
    { "<leader>wv",  "<cmd>vertical resize -15<cr>",                                              desc = "[W]indow [v]ertically decrease",         mode = "n" },
    { "<leader>wH",  "<cmd>resize +10<cr>",                                                       desc = "[W]indow [H]orizontally increase",       mode = "n" },
    { "<leader>wh",  "<cmd>resize -10<cr>",                                                       desc = "[W]indow [h]orizontally decrease",       mode = "n" },
    { "<leader>we",  "<C-w>=",                                                                    desc = "[W]indow [E]venly resize",               mode = "n" },
    { "<leader>wd",  "<C-w>c",                                                                    desc = "[W]indow [D]elete",                      mode = "n" },
    { "<C->>",       "<cmd>vertical resize +15<cr>",                                              desc = "[W]indow [V]ertically increase",         mode = "n" },
    { "<C-<>",       "<cmd>vertical resize -15<cr>",                                              desc = "[W]indow [v]ertically decrease",         mode = "n" },

    -- Reformat, Rename
    { "<leader>a",   group = " [A]ction" },
    { "<leader>af",  vim.lsp.buf.format,                                                          desc = "[A]ction [F]ormat code",                 mode = { "n", "v" } },
    { "<leader>ar",  vim.lsp.buf.rename,                                                          desc = "[A]ction [R]ename (cursor)",             mode = "n" },
    { "<leader>at",  require("core.utils").set_tabwidth,                                          desc = "[A]ction [T]ab-width",                   mode = "n" },
    { "<leader>ad",  function() require("notify").dismiss({ silent = true, pending = true }) end, desc = "[A]ction [D]ismiss all notifications",   mode = "n" },

    -- Tabs
    { "<leader>t",   group = " [T]ab" },
    { "<leader>tn",  "<cmd>tabnext<cr>",                                                          desc = "[T]ab: [N]ext",                          mode = "n" },
    { "<leader>tp",  "<cmd>tabprevious<cr>",                                                      desc = "[T]ab: [P]revious",                      mode = "n" },
    { "<leader>td",  "<cmd>tabclose<cr>",                                                         desc = "[T]ab: [D]elete",                        mode = "n" },
    { "<leader>tt",  "<cmd>tabnew<cr>",                                                           desc = "[T]ab: new [T]ab",                       mode = "n" },
  }
)
