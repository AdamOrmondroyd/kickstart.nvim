return {
  --
  -- copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
      -- vim.keymap.set('i', '<C-\\>',
      --   require("copilot.suggestion").accept_word()
      -- )
    end,
  },
  --
  -- copilot cmp interface
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  },
}
