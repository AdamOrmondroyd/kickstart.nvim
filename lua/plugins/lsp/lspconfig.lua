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
    end,
  }
)

return {
  --
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    --
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim',
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
    { "williamboman/mason-lspconfig.nvim",
      dependencies = { 'mason.nvim' },
      config = function()
        local masonlspconfig = require('mason-lspconfig')
        masonlspconfig.setup()
        masonlspconfig.setup_handlers({
          -- generic handler
          function (server_name)
            require('lspconfig')[server_name].setup({})
          end,
          -- targeted overrides
          ["lua_ls"] = function ()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {
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
            }
           end,
        })
      end,
    },
    --
    -- Automatically install LSPs to stdpath for neovim
    { "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = {
          'debugpy',
          'json-lsp',
          'ltex-ls',
          'pylint',
          'pydocstyle',
          'pyproject-flake8',
          'python-lsp-server',
          'shfmt',
          'stylua',
        }
      }
    },
    --
    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim', opts = {} },
    --
    -- Additional lua configuration, makes nvim stuff amazing!
    {
      'folke/neodev.nvim',
      config = function()
        require('neodev').setup()
      end,
    },
  }
}
