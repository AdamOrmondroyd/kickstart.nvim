-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  --
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  --
  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
  --
  -- Surround text with brackets
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end,
  },
  --
  -- Autopair brackets
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { "TelescopePrompt" , "vim" },
      })
    end,
  },
  --
  --function signature help
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      require'lsp_signature'.setup()
    end,
  },
  --
  -- Highlight undo
  {
    'tzachar/highlight-undo.nvim',
    config = function()
      require('highlight-undo').setup({
        duration = 300,
        undo = {
          hlgroup = 'HighlightUndo',
          mode = 'n',
          lhs = 'u',
          map = 'undo',
          opts = {}
        },
        redo = {
          hlgroup = 'HighlightUndo',
          mode = 'n',
          lhs = '<C-r>',
          map = 'redo',
          opts = {}
        },
        highlight_for_count = true,
      })
    end;
  }
}
