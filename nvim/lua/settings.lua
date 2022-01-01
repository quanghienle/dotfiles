
vim.cmd [[
    syntax enable
    filetype plugin indent on
]]

local options = {
    background = 'dark',

    termguicolors = true,
    splitbelow = true,
    splitright = true,
    hlsearch = true,
    incsearch = true,
    ruler = true,
    swapfile = false,
    wrap = false,
    showcmd = true,
    expandtab = true,
    autoindent = true,
    autoread = true,
    smartcase = true,
    hidden = true,
    backup = false,
    writebackup = false,
    errorbells = false,
    wildmenu = true,
    number = true,
    signcolumn = 'yes',
    relativenumber = true,
    cursorline = true,
    cursorlineopt = 'both',

    updatetime = 300,
    mouse = 'a',
    textwidth = 100,
    shiftwidth = 4,
    softtabstop = 4,
    tabstop = 4,
    pumheight = 10,
    scrolloff = 8,
    laststatus = 2,

    backspace = "indent,eol,start",
    clipboard = 'unnamed',
    encoding = 'utf-8',
    wildmode = 'longest,list,full',
    wildignore = 'log/**,node_modules/**,target/**,tmp/**,*.rbc',
}

vim.opt.shortmess:append('c');
vim.opt.path:append('**');
vim.opt.fillchars:append('vert:│');

-- vim.opt.shellcmdflag:remove('c');
vim.opt.directory:remove('.');

local globals = {
    mapleader = ",",
    gitgutter_sign_modified_removed = '≃'
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end
