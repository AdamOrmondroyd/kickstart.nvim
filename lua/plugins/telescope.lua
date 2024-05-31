-- telescope

return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'folke/todo-comments.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      local builtin = require('telescope.builtin')
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
      }
      pcall(require('telescope').load_extension, 'fzf')
      local keymap = vim.keymap
      keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      local function telescope_live_grep_open_files()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end
      local function find_project_files(opts)
        opts = opts or {}
        local ok = pcall(builtin.git_files, opts)
        if not ok then
          builtin.find_files(opts)
        end
      end
      keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
      keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      keymap.set('n', '<leader>sf', find_project_files, { desc = '[S]earch [F]iles' })
      keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]resume' })
      keymap.set('n', '<leader>sc', builtin.spell_suggest, { desc = '[S]pell [C]heck' })
      keymap.set('n', '<leader>st', builtin.git_status, { desc = '[S]earch git s[T]atus' })
      keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch [W]ord under cursor' })
      keymap.set('n', '<leader>sd', "<cmd>TodoTelescope<cr>", { desc = '[S]earch to[D]o' })
    end,
  },
}
