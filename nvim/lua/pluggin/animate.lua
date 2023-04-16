local animate = require("mini.animate")

local mouse_scrolled = false
for _, scroll in ipairs({ "Up", "Down" }) do
  local key = "<ScrollWheel" .. scroll .. ">"
  vim.keymap.set({ "", "i" }, key, function()
    mouse_scrolled = true
    return key
  end, { expr = true })
end

local timing_func = animate.gen_timing.linear({ duration = 200, unit = "total" })

animate.setup({
  cursor = {
    timing = timing_func
  },
  resize = {
    timing = timing_func
  },
  scroll = {
    timing = timing_func,
    subscroll = animate.gen_subscroll.equal({
      predicate = function(total_scroll)
        if mouse_scrolled then
          mouse_scrolled = false
          return false
        end
        return total_scroll > 1
      end,
    }),
  },
})
