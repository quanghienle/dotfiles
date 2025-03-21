return {
  "snacks.nvim",
  opts = {
    dashboard = {
      width = 60,
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⠶⠶⠶⠶⠤⠤⠤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠔⠊⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⢶⣾⠋⢉⣉⣉⣛⣛⣍⣽⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠴⠋⢀⡔⠉⠀⠀⣀⣠⣤⣤⣵⣼⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣴⣏⡥⠔⠊⠉⣀⣤⠞⠉⠀⠀⠀⠀⠀⠈⡇⣨⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⠿⠟⠛⠛⢿⣶⡶⣦⣤⣄⣀⠀⠀⠀⠀
⠀⠀⢀⠶⠒⠋⣹⠟⢉⣀⠤⠖⠛⠉⠀⢀⣠⠴⠚⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢶⣦⡀⠀⠀⠀⠉⠁⠀⠀⠀⠉⠙⠻⣶⣄⠀
⠀⡴⠿⠒⠒⡾⠀⢠⠾⠁⠀⣀⡀⠀⣴⡋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠈⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣇
⠘⠇⠀⢀⡞⠀⠀⠀⠀⢠⡾⠋⠀⠀⠈⠉⠉⠉⠉⠉⠉⠉⠉⠉⠻⠉⣻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣹⣿⣿⡭⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡏
⠀⠀⢠⠞⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⣀⣠⣤⠤⠤⠤⠤⠤⠤⠤⠔⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣾⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⠁
⠀⣰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣶⣿⣧⣾⣤⣀⣀⣀⣰⡄⠀⢀⣀⣶⣤⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡟⠁⠀
⠐⠋⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⣀⣴⠟⠋⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⠟⠋⠉⠉⠛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣀⣼⠿⠋⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡿⠁⠀⠀⠀⠀⠀⠀⠈⠋⠙⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⣠⣤⣶⡟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣀⣴⠾⣏⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣠⠴⠋⠁⠀⠀⣿⣿⣦⣀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⡿⢿⣆⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⡼⠃⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣶⣤⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣴⣾⠟⠉⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣧⠀⠻⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠜⠁⠀⠀⠀⠀⠀⢸⡏⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣶⣿⣿⣿⣿⣿⣿⣿⣏⡁⠉⠋⢁⣠⡾⠿⠛⣿⣿⡇⢹⣿⣿⣶⣌⠙⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠛⠻⢿⣯⡉⠉⠉⣅⣰⣶⠂⢠⣿⡟⢀⣾⣿⣆⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠻⠈⢿⣿⣿⣿⣏⠉⠉⠉⠉⠉⠉⢹⣿⣇⠀⠀⠀⠀⠀⠈⠀⠐⠋⠓⠀⠀⣼⣋⣴⡇⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣧⡉⠀⠀⠀⠀⠀⠀⠘⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⠋⠛⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣄⠀⠀⠀⠀⠀⠀⠙⠛⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⠜⠉⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠿⣷⣄⠀⠀⠐⠒⠒⠒⠒⠒⠒⠒⠒⠀⠀⠀⣠⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠘⣷⣤⡀⠀⠀⠘⠛⠛⠂⠀⠀⠀⣠⡾⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠘⣿⣿⣷⣦⣄⡀⠀⠀⣀⣴⣿⣿⠰⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⠀⣀⡘⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⢻⡀⠀⢀⣀⣀⣠⣤⣤⣄⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⠋⠉⠁⠀⠀⠈⠉⠉⢹⠇⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠘⢿⡛⠉⠉⠁⠀⠀⠀⠀⠀⠉⠙⢿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢠⣾⠀⠀⠀⠀⣀⣤⣴⣶⠾⠏⠀⠀⢣⠀⠀⢻⣿⣿⣿⡿⠋⢹⣿⠇⠀⠀⠀⠀⠙⢆⣀⣤⣤⣄⣀⡀⠀⠀⠀⠀⠙⢷⡄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⢀⡾⠛⠛⠻⣏⠀⠀⠀⠀⢸⣇⠀⠀⢿⣿⡛⠁⠀⣾⡿⠀⣠⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠙⠀⠀⠀⠀⠀⠀⠀
        ]],
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      formats = {
        key = function(item)
          return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        end,
      },
      sections = {
        { section = "header" },
        {
          pane = 2,
          { title = "", padding = 1 },
          { icon = " ", title = "Keymaps", padding = 1 },
          { section = "keys", indent = 4, padding = 1 },
          { icon = " ", title = "Recent Files", padding = 1 },
          { section = "recent_files", indent = 4, padding = 1 },
          { icon = " ", title = "Projects", padding = 1 },
          { section = "projects", indent = 4, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
