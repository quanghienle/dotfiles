local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'ThePrimeagen/vim-be-good'

Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'simrat39/symbols-outline.nvim'

Plug 'lukas-reineke/indent-blankline.nvim'

--Plug 'ggandor/lightspeed.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = vim.fn['make']})

Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn[':TSUpdate']})
Plug 'p00f/nvim-ts-rainbow'

Plug 'akinsho/toggleterm.nvim'

--Plug 'norcalli/nvim-colorizer.lua'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
Plug 'hrsh7th/nvim-cmp' -- Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-calc' -- LSP source for nvim-cmp
--Plug('tzachar/cmp-tabnine', {['do'] = vim.fn['./install.sh']})
Plug 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip'

Plug 'glepnir/lspsaga.nvim'

--Plug('neoclide/coc.nvim', {branch = 'release'})
--Plug 'fannheyward/telescope-coc.nvim'

Plug 'preservim/nerdcommenter'
Plug 'github/copilot.vim'

Plug 'flazz/vim-colorschemes'
Plug 'shaunsingh/nord.nvim'
Plug 'drewtempelmeyer/palenight.vim'

--Plug 'vim-airline/vim-airline'
--Plug 'vim-airline/vim-airline-themes'

Plug 'liuchengxu/vim-which-key'

vim.call('plug#end')
