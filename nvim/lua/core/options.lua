vim.g.mapleader = ","
vim.g.maplocalleader = ","

local options = {
  background = "dark",
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
  --numberwidth = 3,
  --statuscolumn = "%=%{v:virtnum<1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . ' ' : v:lnum) : ''}%=%s",
  signcolumn = "yes",
  relativenumber = true,
  cursorline = true,
  cursorlineopt = "both",
  updatetime = 300,
  mouse = "a",
  textwidth = 140,
  --tab
  shiftwidth = 2,
  softtabstop = 2,
  tabstop = 2,
  pumheight = 10,
  scrolloff = 8,
  laststatus = 0,
  backspace = "indent,eol,start",
  clipboard = "unnamed",
  encoding = "utf-8",
  wildmode = "longest,list,full",
  wildignore = "log/**,node_modules/**,target/**,tmp/**,*.rbc",
  --spell = true,
  spelllang = {"en"},
  --guicursor="n-c-v:block,i-ci-ve:ver25,r-cr:hor20,o:hor50",
  --
  completeopt = "menuone,noselect", -- Set completeopt to have a better completion experience
}

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen"
  vim.opt.shortmess:append({ C = true })
end

for k, v in pairs(options) do
  vim.opt[k] = v
end
