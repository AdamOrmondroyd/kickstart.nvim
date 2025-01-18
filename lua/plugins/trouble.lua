-- trouble

return {
  --
  -- quickfix list
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    { "<leader>xx", "<cmd>Trouble close<CR>",                       desc = "[x]rouble [x]lose" },
    { "<leader>xd", "<cmd>Trouble diagnostics toggle<CR>",          desc = "[x]rouble [D]iagnostics" },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "[x]rouble [W]orkspace" },
    { "<leader>xd", "<cmd>Trouble diagnostics toggle<CR>",          desc = "[x]rouble [D]iagnostics" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<CR>",               desc = "[x]rouble [Q]uickfix" },
    { "<leader>xl", "<cmd>Trouble loclist toggle<CR>",              desc = "[x]rouble [L]ocation" },
    { "<leader>xt", "<cmd>Trouble todo toggle<CR>",                 desc = "[x]rouble [T]odo" },
  },
}
