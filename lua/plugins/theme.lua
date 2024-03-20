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
    whichkey.register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ocument/[D]iff', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>h'] = { name = 'Git [H]unk/[H]ighlight', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename/[R]estore', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]ree/[T]ab', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    }
    -- register which-key VISUAL mode
    -- required for visual <leader>hs (hunk stage) to work
    whichkey.register({
      ['<leader>'] = { name = 'VISUAL <leader>' },
      ['<leader>h'] = { 'Git [H]unk' },
    }, { mode = 'v' })
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
      excluded_ft = {"text", "markdown", "rst", "lua"}
    },
  }
}
