--
-- autocmd which runs when a buffer is attached to a language server
vim.api.nvim_create_autocmd('LspAttach',
  {
    desc = 'LSP actions on attach',
    callback = function(args)
      local bufnr = args.buf
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end
      nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      nmap('<leader>ca', function()
        vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
      end, '[C]ode [A]ction')

      nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
      nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
      nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

      -- See `:help K` for why this keymap
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

      -- Lesser used LSP functionality
      nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, '[W]orkspace [L]ist Folders')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
      
      -- Enable built-in completion for Neovim 0.11+
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client.supports_method('textDocument/completion') then
        vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
      end
    end,
  }
)

return {
  --
  -- LSP Configuration using native vim.lsp.config (Neovim 0.11+)
  {
    'williamboman/mason.nvim',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { 'mason.nvim' },
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          -- 'pylsp',
        }
      })
      
      -- Configure LSP servers using native vim.lsp.config
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            completion = { callSnipped = 'Replace', },
            diagnostics = {
              globals = { "vim" },
              -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- disable = { 'missing-fields' },
            }
          }
        }
      })
      
      -- ltex config for PhD thesis writing
      vim.lsp.config('ltex', {
        settings = {
          ltex = {
            language = "en-GB",
            disabledRules = {
              tex = { "SENTENCE_WHITESPACE" }
            }
          }
        }
      })
      
      -- Enable LSP servers
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('ltex')
    end,
  },
  --
  -- Automatically install LSPs to stdpath for neovim
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- 'debugpy',
        'codespell',
        'json-lsp',
        -- 'ltex-ls',
        -- 'pylint',
        -- 'pydocstyle',
        -- 'pyproject-flake8',
        -- 'python-lsp-server',
        'ruff',
        'shfmt',
        'stylua',
        'ty',
      }
    }
  },
  --
  -- Useful status updates for LSP
  -- WARN: this plugin is frikkin slow
  { 'j-hui/fidget.nvim', opts = {} },
}
