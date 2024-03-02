-- theme and other ui

return {
  -- Show pending keybindings
  {
    'folke/which-key.nvim',
    opts = {}
  },

  -- Theme inspired by Atom
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('onedark').setup {
        -- Set a style preset. 'dark' is default.
        style = 'dark', -- dark, darker, cool, deep, warm, warmer, light
      }
      require('onedark').load()
    end,
  },
  -- Set lualine as statusline
  {
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  -- Add indentation guides even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  -- indicate when line reaches 80 characters
  {
    "ecthelionvi/NeoColumn.nvim",
    opts = {
      always_on = true,
      excluded_ft = {"text", "markdown", "rst", "lua"}
    },
  }
}
