-- sesssions are stored at ~/.local/state/nvim/sessions
require("persistence").setup({
  options = { "buffers", "curdir", "tabpages", "winsize", "globals" }
})

vim.api.nvim_create_autocmd(
  "VimEnter",
  {
    group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
    callback = function()
      local session_path = require("persistence").get_current()
      local session_exists = session_path and vim.fn.filereadable(session_path) ~= 0
      if session_exists and vim.fn.getcwd() ~= vim.env.HOME then
        vim.ui.select(
          { 'YES', 'NO' },
          { prompt = 'Load previously saved session?' },
          function(choice)
            require("nvim-tree.api").tree.focus()
            if choice == 'YES' then
              require("persistence").load()
            end
          end
        )
        --
        --require("persistence").load()
        --vim.api.nvim_command('vertical wincmd =')
        --vim.api.nvim_command('horizontal wincmd =')
      else
        require("nvim-tree.api").tree.focus()
      end
    end,
    nested = true,
  }
)
