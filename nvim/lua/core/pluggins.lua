local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.nvim-plugins")

Plug "lewis6991/gitsigns.nvim"

Plug "tpope/vim-surround"
Plug "windwp/nvim-autopairs"
Plug "windwp/nvim-ts-autotag"
Plug "p00f/nvim-ts-rainbow"

Plug "kyazdani42/nvim-web-devicons"
Plug "kyazdani42/nvim-tree.lua"

Plug "nvim-lualine/lualine.nvim"
Plug "akinsho/bufferline.nvim"

Plug "petertriho/nvim-scrollbar"

Plug "lukas-reineke/indent-blankline.nvim"
Plug "echasnovski/mini.indentscope"

Plug 'echasnovski/mini.jump'

Plug "RRethy/vim-illuminate"

Plug "nvim-lua/plenary.nvim"
Plug "nvim-telescope/telescope.nvim"

Plug("nvim-treesitter/nvim-treesitter", { ["do"] = vim.fn[":TSUpdate"] })

Plug "NvChad/nvim-colorizer.lua"

Plug "simrat39/symbols-outline.nvim"

Plug "folke/zen-mode.nvim"

Plug 'nacro90/numb.nvim'
Plug "LudoPinelli/comment-box.nvim"

--Plug "mfussenegger/nvim-dap"

Plug "neovim/nvim-lspconfig"
Plug("williamboman/mason.nvim", { ["do"] = vim.fn[":MasonUpdate"] })
Plug "williamboman/mason-lspconfig.nvim"

-- Autocompletion plugin
Plug "hrsh7th/nvim-cmp"
Plug "hrsh7th/cmp-nvim-lsp"
Plug "hrsh7th/cmp-buffer"
Plug "hrsh7th/cmp-path"
Plug "hrsh7th/cmp-cmdline"
Plug "hrsh7th/cmp-calc"
Plug "hrsh7th/cmp-nvim-lsp-signature-help"

Plug "aznhe21/actions-preview.nvim"

-- lua snip
Plug "saadparwaiz1/cmp_luasnip"
Plug "L3MON4D3/LuaSnip"

Plug("VonHeikemen/lsp-zero.nvim", { branch = "v2.x" })

Plug("onsails/lspkind.nvim")

Plug "windwp/nvim-spectre"
Plug "folke/trouble.nvim"

Plug "MunifTanjim/nui.nvim"
Plug "rcarriga/nvim-notify"
Plug "stevearc/dressing.nvim"
Plug "folke/noice.nvim"

Plug "preservim/nerdcommenter"

Plug "folke/which-key.nvim"

Plug "Shatur/neovim-session-manager"

Plug "EdenEast/nightfox.nvim"
Plug("catppuccin/nvim", { as = "catppuccin" })

--Plug "github/copilot.v"zbirenbaum/copilot.lua
Plug "zbirenbaum/copilot.lua"
Plug "zbirenbaum/copilot-cmp"
Plug 'renerocksai/telekasten.nvim'

Plug 'ThePrimeagen/harpoon'

Plug "tpope/vim-fugitive"
Plug "kdheepak/lazygit.nvim"
Plug "aaronhallaert/advanced-git-search.nvim"

vim.call("plug#end")
