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
            accept = "<C-Right>",
            accept_word = "<Right>",
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
