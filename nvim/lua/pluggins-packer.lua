vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},
      {'hrsh7th/cmp-cmdline'},
      {'hrsh7th/cmp-calc'},
      {'saadparwaiz1/cmp_luasnip'}

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
	  }
  }

  use 'shaunsingh/nord.nvim'
end)

--local Plug = vim.fn['plug#']

----vim.call('plug#begin', '~/.config/nvim/plugged')
--vim.call('plug#begin', '~/.nvim-plugins')

--Plug 'lewis6991/gitsigns.nvim'

--Plug 'tpope/vim-surround'
--Plug 'windwp/nvim-autopairs'
--Plug 'windwp/nvim-ts-autotag'


--Plug 'nvim-lualine/lualine.nvim'
--Plug 'akinsho/bufferline.nvim'

----Plug 'lukas-reineke/indent-blankline.nvim'

----Plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = vim.fn['make']})

--Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn[':TSUpdate']})
--Plug 'p00f/nvim-ts-rainbow'

--Plug 'akinsho/toggleterm.nvim'



--Plug('VonHeikemen/lsp-zero.nvim', {branch = 'v2.x'})

--Plug 'folke/trouble.nvim'

--Plug 'preservim/nerdcommenter'
----Plug 'github/copilot.vim'

----Plug "folke/which-key.nvim"

----Plug 'flazz/vim-colorschemes'
--Plug 'shaunsingh/nord.nvim'
--Plug('catppuccin/nvim', { as = 'catppuccin' })
----Plug 'drewtempelmeyer/palenight.vim'

----Plug 'mbbill/undotree'

--vim.call('plug#end')
