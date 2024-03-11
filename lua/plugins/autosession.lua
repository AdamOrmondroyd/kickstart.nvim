return {
  --
  -- Restore last session
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    local function change_nvim_tree_dir()
      local nvim_tree = require("nvim-tree")
      nvim_tree.change_dir(vim.fn.getcwd())
    end

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = {
        "~/", "~/Downloads", "~/Documents", "~/Desktop/", "~/OneDrive",
      },
      pre_save_cmds = "NvimTreeClose",
      post_restore_cmds = { change_nvim_tree_dir, "NvimTreeOpen" },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>rs", "<cmd>SessionRestore<CR>", { desc = "[R]estore [S]ession" }) -- restore last workspace session for current directory
    keymap.set("n", "<leader>rw", "<cmd>SessionSave<CR>", { desc = "[R]estore session [W]rite" }) -- save workspace session for current working directory
  end,
}
