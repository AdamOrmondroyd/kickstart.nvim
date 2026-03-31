-- Treesitter
-- See `:help nvim-treesitter`

return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup()

      -- Install parsers (no-op if already installed)
      local parsers = {
        'c', 'cpp', 'fortran', 'go', 'lua', 'python',
        'rust', 'tsx', 'javascript', 'typescript',
        'vimdoc', 'vim', 'bash', 'markdown', 'markdown_inline',
      }
      for _, lang in ipairs(parsers) do
        vim.api.nvim_create_autocmd('FileType', {
          pattern = lang,
          once = true,
          callback = function()
            pcall(require('nvim-treesitter').install, lang)
          end,
        })
      end

      -- Enable treesitter highlight and indent
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = {
          lookahead = true,
        },
        move = {
          set_jumps = true,
        },
        swap = {},
      }

      -- Textobject select keymaps
      local select_keymap = {
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      }
      for key, query in pairs(select_keymap) do
        vim.keymap.set({ 'x', 'o' }, key, function()
          require('nvim-treesitter-textobjects.select').select_textobject(query, 'textobjects')
        end)
      end

      -- Textobject move keymaps
      local ts_move = require('nvim-treesitter-textobjects.move')
      local move_keymaps = {
        { ']m', 'goto_next_start', '@function.outer' },
        { ']]', 'goto_next_start', '@class.outer' },
        { ']M', 'goto_next_end', '@function.outer' },
        { '][', 'goto_next_end', '@class.outer' },
        { '[m', 'goto_previous_start', '@function.outer' },
        { '[[', 'goto_previous_start', '@class.outer' },
        { '[M', 'goto_previous_end', '@function.outer' },
        { '[]', 'goto_previous_end', '@class.outer' },
      }
      for _, m in ipairs(move_keymaps) do
        vim.keymap.set({ 'n', 'x', 'o' }, m[1], function()
          ts_move[m[2]](m[3], 'textobjects')
        end)
      end

      -- Textobject swap keymaps
      local ts_swap = require('nvim-treesitter-textobjects.swap')
      vim.keymap.set('n', '<leader>a', function()
        ts_swap.swap_next('@parameter.inner', 'textobjects')
      end)
      vim.keymap.set('n', '<leader>A', function()
        ts_swap.swap_previous('@parameter.inner', 'textobjects')
      end)
    end,
  },
}
