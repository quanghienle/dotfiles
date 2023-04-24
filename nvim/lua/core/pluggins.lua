local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.nvim-plugins")

Plug "lewis6991/gitsigns.nvim"

Plug "tpope/vim-surround"
Plug "windwp/nvim-autopairs"
Plug "windwp/nvim-ts-autotag"

Plug "kyazdani42/nvim-web-devicons"
Plug "kyazdani42/nvim-tree.lua"

Plug "nvim-lualine/lualine.nvim"
Plug "akinsho/bufferline.nvim"

--Plug "SmiteshP/nvim-navic"
--Plug "utilyre/barbecue.nvim"



Plug "lukas-reineke/indent-blankline.nvim"
Plug "echasnovski/mini.indentscope"

Plug "RRethy/vim-illuminate"

Plug "nvim-lua/plenary.nvim"
Plug "nvim-telescope/telescope.nvim"

Plug("nvim-treesitter/nvim-treesitter", {["do"] = vim.fn[":TSUpdate"]})
Plug "p00f/nvim-ts-rainbow"

Plug "NvChad/nvim-colorizer.lua"

Plug "simrat39/symbols-outline.nvim"

Plug "folke/zen-mode.nvim"

Plug "neovim/nvim-lspconfig"
Plug("williamboman/mason.nvim", {["do"] = vim.fn[":MasonUpdate"]})
Plug "williamboman/mason-lspconfig.nvim"

 -- Autocompletion plugin
Plug "hrsh7th/nvim-cmp"
Plug "hrsh7th/cmp-nvim-lsp"
Plug "hrsh7th/cmp-buffer"
Plug "hrsh7th/cmp-path"
Plug "hrsh7th/cmp-cmdline"
Plug "hrsh7th/cmp-calc"
Plug "hrsh7th/cmp-nvim-lsp-signature-help"

-- lua snip
Plug "saadparwaiz1/cmp_luasnip"
Plug "L3MON4D3/LuaSnip"

Plug("VonHeikemen/lsp-zero.nvim", {branch = "v2.x"})

Plug("onsails/lspkind.nvim")


Plug "windwp/nvim-spectre"
Plug "folke/trouble.nvim"

Plug "MunifTanjim/nui.nvim"
Plug "rcarriga/nvim-notify"
Plug "folke/noice.nvim"
Plug "stevearc/dressing.nvim"

Plug "preservim/nerdcommenter"

Plug "folke/which-key.nvim"

-- Sessions
Plug "Shatur/neovim-session-manager"

--Plug "nvim-zh/colorful-winsep.nvim"

Plug "shaunsingh/nord.nvim"
Plug "folke/tokyonight.nvim"
Plug "EdenEast/nightfox.nvim"
Plug( 'catppuccin/nvim', {['as'] = 'catppuccin'} )
Plug "cocopon/iceberg.vim"
Plug "rmehri01/onenord.nvim"
Plug "marko-cerovac/material.nvim"

vim.call("plug#end")
