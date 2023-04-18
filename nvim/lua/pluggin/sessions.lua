-- sesssions are stored at ~/.local/shared/nvim/sessions
require('session_manager').setup({
  --Possible values: Disabled, CurrentDir, LastSession
  autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
  autosave_ignore_filetypes = { 'gitcommit', 'NvimTree' },
  autosave_ignore_buftypes = { 'NvimTree' },
})

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
