local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'

Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn[':TSUpdate']})

Plug 'simrat39/symbols-outline.nvim'


Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'drewtempelmeyer/palenight.vim'

Plug 'liuchengxu/vim-which-key'

vim.call('plug#end')

vim.g.mapleader = ','


-- set
local set = vim.opt
set.background = 'dark'
set.termguicolors = true
set.splitbelow = true
set.splitright = true
set.path += '**'
set.ruler = true
set.textwidth = 100 
set.shiftwidth = 4 
set.pumheight = 10
set.noswapfile = true 
set.nowrap = true
set.showcmd = true
set.expandtab = true 
set.softtabstop = 4 
set.tabstop = 4 
set.backspace = 2
set.autoindent = true 
set.autoread = true
set.ignorecase = true
set.smartcase = true
set.clipboard = 'unnamed'
set.directory -= '.' 
set.encoding = 'utf-8'
set.laststatus = 2 
set.scrolloff = 5
set.wildignore = 'log/**,node_modules/**,target/**,tmp/**,*.rbc'
set.wildmenu = true 
set.wildmode = 'longest,list,full'
set.mouse = 'a'
set.hidden = true
set.nobackup = true
set.nowritebackup = true
set.updatetime = 300
set.shortmess += 'c'

set.number = true
set.signcolumn = 'yes' 
set.relativenumber = true
set.cursorline = true
set.cursorlineopt = 'both'

set.fillchars += 'vert:│'




local cmd = vim.cmd
cmd 'colorscheme iceberg'
cmd 'syntax enable'
cmd 'filetype plugin indent on'

-- map
local map = vim.api.nvim_set_keymap
map('n', '<Leader>ws', ':w<CR>:source %<CR>:nohl<CR>', {noremap = true})

map('n', 'G', 'Gzz', {noremap = true})
map('n', 'n', 'nzz', {noremap = true})
map('n', 'N', 'Nzz', {noremap = true})


