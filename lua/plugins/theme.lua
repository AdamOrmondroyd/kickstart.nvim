-- theme and other straigtforward ui

return {
  --
  -- Show pending keybindings
  {
    'folke/which-key.nvim',
    config = function()
      local whichkey = require 'which-key'
      whichkey.setup {}

      -- document keybindings
      whichkey.add {
        { "<leader>c", group = "[C]ode" },
        { "<leader>d", group = "[D]ocument/[D]iff" },
        { "<leader>g", group = "[G]it" },
        { "<leader>h", group = "Git [H]unk/[H]ighlight" },
        { "<leader>o", group = "[O]bsidian" },
        { "<leader>r", group = "[R]ename/[R]estore" },
        { "<leader>s", group = "[S]earch" },
        { "<leader>t", group = "[T]ree/[T]ab" },
        { "<leader>w", group = "[W]orkspace" },
        { "<leader>x", group = "[X]rouble" },
        { mode = "v", {
            { "<leader>", group = "VISUAL <leader>" },
            { "<leader>h", group = "Git [H]unk/[H]ighlight" },
          },
        }
      }
    end,
  },
  --
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
  --
  -- Set lualine as statusline
  {
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = { left = '', right = ''},
      },
      sections = {
        lualine_c = {
          {
            'filename',
            file_status = true, -- displays file status (readonly, modified, etc)
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
      }
    },
  },
  --
  -- Add indentation guides even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  --
  -- indicate when line reaches 80 characters
  {
    "ecthelionvi/NeoColumn.nvim",
    opts = {
      always_on = true,
      excluded_ft = { "text", "markdown", "rst", "lua", "tex" }
    },
  }
}
