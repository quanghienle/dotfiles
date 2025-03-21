return {
    "nvim-treesitter/nvim-treesitter",
    keys = {
      { "<leader>ci", desc = "Increment Selection" },
      { "<leader>cI", desc = "Decrement Selection", mode = "x" },
    },
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>ci",
          node_incremental = "<leader>ci",
          scope_incremental = false,
          node_decremental = "<leader>cI",
        },
      },
    },
}
