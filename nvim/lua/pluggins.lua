local Plug = vim.fn['plug#']

--vim.call('plug#begin', '~/.config/nvim/plugged')
vim.call('plug#begin', '~/.nvim-plugins')

Plug 'lewis6991/gitsigns.nvim'

Plug 'tpope/vim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'

--Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
--Plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = vim.fn['make']})

Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn[':TSUpdate']})
Plug 'p00f/nvim-ts-rainbow'

Plug 'akinsho/toggleterm.nvim'

Plug 'neovim/nvim-lspconfig'
Plug('williamboman/mason.nvim', {['do'] = vim.fn[':MasonUpdate']})
Plug 'williamboman/mason-lspconfig.nvim'

 -- Autocompletion plugin
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-calc'

-- lua snip
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug('VonHeikemen/lsp-zero.nvim', {branch = 'v2.x'})

Plug 'folke/trouble.nvim'

Plug 'preservim/nerdcommenter'
--Plug 'github/copilot.vim'

--Plug "folke/which-key.nvim"

--Plug 'flazz/vim-colorschemes'
Plug 'shaunsingh/nord.nvim'
Plug('catppuccin/nvim', { as = 'catppuccin' })
--Plug 'drewtempelmeyer/palenight.vim'

--Plug 'mbbill/undotree'

vim.call('plug#end')
