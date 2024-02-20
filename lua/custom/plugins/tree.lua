-- nvim-tree 
--
return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.keymap.set('n', '<leader>tt', require('nvim-tree.api').tree.toggle, { desc = '[T]ree [T]oggle' })
      vim.keymap.set('n', '<leader>tc', require('nvim-tree.api').tree.close, { noremap=true, desc = '[T]ree [C]lose' })
      vim.keymap.set('n', '<leader>tr', require('nvim-tree.api').tree.reload, { noremap=true, desc = '[T]ree [R]efresh' })
      vim.keymap.set('n', '<leader>tf', require('nvim-tree.api').tree.focus, { noremap=true, desc = '[T]ree [F]ocus' })
      require("nvim-tree").setup {}
    end,
}
