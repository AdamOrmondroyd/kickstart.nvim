return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>tn", "<cmd>tabnew<cr>",   desc = "[T]ab [N]ew" },
    { "<leader>tc", "<cmd>tabclose<cr>", desc = "[T]ab [C]lose" },
  },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "thin",
      numbers = "ordinal",
    }
  }
}
