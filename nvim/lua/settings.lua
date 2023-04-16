vim.cmd [[
    syntax enable
    filetype plugin indent on
]]

vim.g.mapleader = ","

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
  ignorecase = true,
  --smartcase = true,
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
  --tab
  shiftwidth = 2,
  softtabstop = 2,
  tabstop = 2,
  pumheight = 10,
  scrolloff = 8,
  laststatus = 2,
  backspace = "indent,eol,start",
  clipboard = 'unnamed',
  encoding = 'utf-8',
  wildmode = 'longest,list,full',
  wildignore = 'log/**,node_modules/**,target/**,tmp/**,*.rbc',
  --spell = true,
  --spelllang = 'en_us'
	--guicursor='n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50'
}


local appendOpts = {
  shortmess = 'c',
  path = '**',
  --fillchars = 'vert:│'
}

-- vim.opt.shellcmdflag:remove('c');
vim.opt.directory:remove('.');

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(appendOpts) do
  vim.opt[k]:append(v)
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'TelescopePreviewerLoaded',
  command = 'setlocal wrap number'
})
