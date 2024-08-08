return {
  --
  -- copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept_word = "<C-space>",
            accept = "<C-enter>",
          },
        },
        -- panel = { enabled = true },
        filetypes = {
          markdown = true,
        },
      })
    end,
  },
}
