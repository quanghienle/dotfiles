local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.nvim-plugins")

-- brackets
Plug "tpope/vim-surround"
Plug "windwp/nvim-autopairs"
Plug "windwp/nvim-ts-autotag"
Plug "p00f/nvim-ts-rainbow"

-- some visual stuff
Plug "kyazdani42/nvim-web-devicons"
Plug "kyazdani42/nvim-tree.lua"
Plug "nvim-lualine/lualine.nvim"
Plug "akinsho/bufferline.nvim"
Plug "petertriho/nvim-scrollbar"
Plug "echasnovski/mini.indentscope"
Plug 'echasnovski/mini.files'
Plug "RRethy/vim-illuminate"
Plug 'echasnovski/mini.jump'
Plug "NvChad/nvim-colorizer.lua"
Plug "simrat39/symbols-outline.nvim"
Plug 'nacro90/numb.nvim'
Plug "folke/zen-mode.nvim"
Plug "folke/which-key.nvim"
Plug "folke/trouble.nvim"

-- floating UI
Plug "MunifTanjim/nui.nvim"
Plug "rcarriga/nvim-notify"
Plug "stevearc/dressing.nvim"
Plug "folke/noice.nvim"

-- telescope
Plug "nvim-lua/plenary.nvim"
Plug "nvim-telescope/telescope.nvim"

-- commenting
Plug "preservim/nerdcommenter"
Plug "LudoPinelli/comment-box.nvim"

-- lsp
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = vim.fn[":TSUpdate"] })
Plug "neovim/nvim-lspconfig"
Plug("williamboman/mason.nvim", { ["do"] = vim.fn[":MasonUpdate"] })
Plug "williamboman/mason-lspconfig.nvim"
Plug "VonHeikemen/lsp-zero.nvim"
Plug "onsails/lspkind.nvim"
Plug "aznhe21/actions-preview.nvim"

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

-- find and replace
Plug "windwp/nvim-spectre"

-- themes
Plug "EdenEast/nightfox.nvim"
Plug("catppuccin/nvim", { as = "catppuccin" })

Plug 'MeanderingProgrammer/render-markdown.nvim'

-- copilot
Plug "zbirenbaum/copilot.lua"
Plug "zbirenbaum/copilot-cmp"
Plug 'github/copilot.vim'
Plug 'CopilotC-Nvim/CopilotChat.nvim'

-- git stuff
Plug "lewis6991/gitsigns.nvim"
Plug "tpope/vim-fugitive"
Plug "kdheepak/lazygit.nvim"
Plug "aaronhallaert/advanced-git-search.nvim"

-- notes
Plug 'renerocksai/telekasten.nvim'

-- sessions
Plug 'rmagatti/auto-session'

vim.call("plug#end")
