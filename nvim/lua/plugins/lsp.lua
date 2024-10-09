return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} }, -- lsp status updates
    'b0o/schemastore.nvim', -- access to schemastore catalog for json
  },
  config = function()
    local keymap = require('bradleytaylor.utils').keymap

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        local builtin = require 'telescope.builtin'

        map('gd', builtin.lsp_definitions, 'Go to definition')
        map('gr', builtin.lsp_references, 'Show list of references')
        map('gI', builtin.lsp_implementations, 'Go to implementation')
        map('<leader>ds', builtin.lsp_document_symbols, 'Show document symbols')
        map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, 'Show workspace symbols')
        map('<leader>rn', vim.lsp.buf.rename, 'Rename')
        map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
        map('K', vim.lsp.buf.hover, 'Hover docs')
        map('gD', vim.lsp.buf.declaration, 'Go to declaration')
      end,
    })

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = 'rounded',
    })

    -- diagnostics keymaps
    keymap('n', '[d', vim.diagnostic.goto_prev, 'Previous diagnostic message')
    keymap('n', ']d', vim.diagnostic.goto_next, 'Next diagnostic message')
    keymap('n', '<leader>d', vim.diagnostic.open_float, 'Show diagnostic error')
    keymap('n', '<leader>q', vim.diagnostic.setloclist, 'Open diagnostic quickfix list')

    -- change diagnostic symbols
    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    vim.diagnostic.config {
      virtual_text = {
        prefix = '■ ', -- Could be '●', '▎', 'x', '■', , 
      },
      float = { border = 'rounded' },
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      lua_ls = {},
      html = {},
      graphql = {
        filetypes = { 'graphql', 'gql', 'typescriptreact', 'javascriptreact' },
      },
      marksman = {},
      gopls = {},
      dockerls = {},
      ts_ls = {},
      eslint = {},
      pyright = {},
      ruff_lsp = {},
      cssls = {},
      tailwindcss = {},
      jsonls = {
        settings = {
          -- configure schemastore for autocomplete in json files
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      },
    }

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    -- additional tools that aren't LSP servers
    vim.list_extend(ensure_installed, {
      'stylua',
      'prettier',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- only override values explicitly passed to servers above
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
