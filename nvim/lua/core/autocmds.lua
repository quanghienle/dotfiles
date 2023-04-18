
vim.api.nvim_create_autocmd('User', { pattern = 'TelescopePreviewerLoaded', command = 'setlocal wrap number' })

vim.api.nvim_create_autocmd(
  "VimEnter",
  {
    group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
    callback = function()
      require('nvim-tree.api').tree.toggle()
      if require("session_manager.config").dir_to_session_filename():exists() then
        vim.ui.select(
          { 'Yes', 'No' },
          {
            prompt = ' Load previously saved session? ',
            format_item = function(item) return "   " .. item end
          },
          function(choice)
            if choice == 'Yes' then require("session_manager").load_current_dir_session() end
          end
        )
      end
    end,
    nested = true,
  }
)
