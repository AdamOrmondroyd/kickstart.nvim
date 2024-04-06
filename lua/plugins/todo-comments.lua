return {
  "folke/todo-comments.nvim",
  event = { "BufRead", "BufNewFile" },
  depends = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    local todo_comments = require("todo-comments")

    -- set keymaps
    local keymap = vim.keymap
    keymap.set("n", "]t", todo_comments.jump_next, { desc = "Next todo" })
    keymap.set("n", "[t", todo_comments.jump_prev, { desc = "Prev todo" })

    todo_comments.setup()
  end,
}
