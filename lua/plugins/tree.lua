return {
  --
  -- nvim-tree 
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- recommended todisable netrw at the
    -- very start of your init.lua for filetree
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.keymap.set('n', '<leader>tt', require('nvim-tree.api').tree.toggle, { desc = '[T]ree [T]oggle' })
    vim.keymap.set('n', '<leader>tr', require('nvim-tree.api').tree.reload, { noremap=true, desc = '[T]ree [R]efresh' })
    vim.keymap.set('n', '<leader>tf', require('nvim-tree.api').tree.focus, { noremap=true, desc = '[T]ree [F]ocus' })
    require("nvim-tree").setup {}
  end,
}
