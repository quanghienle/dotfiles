-- sesssions are stored at ~/.local/shared/nvim/sessions
require("session_manager").setup({
  --Possible values: Disabled, CurrentDir, LastSession
  autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
  autosave_ignore_filetypes = { "gitcommit", "NvimTree" },
})
