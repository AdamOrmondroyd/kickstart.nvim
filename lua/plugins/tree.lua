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

    require("nvim-tree").setup({
      view = {
        side = "right",
        adaptive_size = true,
      }
    })
    -- quit nvim if nvim-tree is the only window left (so :q works)
    vim.api.nvim_create_autocmd("QuitPre", {
      callback = function()
        local tree_wins = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
          local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
          if bufname:match("NvimTree_") ~= nil then
            table.insert(tree_wins, w)
          end
        end
        if #tree_wins == #wins - 1 then
          for _, w in ipairs(tree_wins) do
            vim.api.nvim_win_close(w, true)
          end
        end
      end,
    })

    vim.keymap.set('n', '<leader>tt', require('nvim-tree.api').tree.toggle, { desc = '[T]ree [T]oggle' })
    vim.keymap.set('n', '<leader>tr', require('nvim-tree.api').tree.reload, { noremap = true, desc = '[T]ree [R]efresh' })
    vim.keymap.set('n', '<leader>tf', require('nvim-tree.api').tree.focus, { noremap = true, desc = '[T]ree [F]ocus' })
    vim.keymap.set('n', '<leader>t.', '<cmd>NvimTreeFindFile<bar>NvimTreeOpen<CR>', { noremap = true, desc = '[T]ree [.]' })
  end,
}
