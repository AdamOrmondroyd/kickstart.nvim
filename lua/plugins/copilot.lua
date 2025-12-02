return {
  --
  -- copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    -- event = "InsertEnter",
    opts = {
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
    },
    config = function(_, opts)
      -- 1) set copilot up with your opts
      require("copilot").setup(opts)
      -- 2) override the inline suggestion colour
      vim.api.nvim_set_hl(0, "CopilotSuggestion", {
        fg     = "#aecfd9",  -- your desired colour
        bg     = "NONE",     -- or whatever
        italic = true,       -- optional
      })
    end,
  },
}
