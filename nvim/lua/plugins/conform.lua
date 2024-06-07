return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Use a sub-list to run only the first available formatter
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescriptreact = { 'prettier' },
      css = { 'prettier' },
      html = { 'prettier' },
      json = { 'prettier' },
    },
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_fallback = true }
    end,
  },
  config = function(_, opts)
    local conform = require('conform')
    conform.setup(opts)

    vim.api.nvim_create_user_command('FormatToggle', function(args)
      if vim.b.disable_autoformat == true or vim.g.disable_autoformat == true then
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      else
        if args.bang then
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end
    end, {
      desc = 'Toggle format on save',
      bang = true,
    })

    vim.keymap.set({ 'n', 'v' }, '<leader>ft', function()
      vim.cmd('FormatToggle')
    end, { desc = 'Format toggle on save' })

    -- command for formatting the current buffer
    vim.keymap.set({ 'n', 'v' }, '<leader>ff', function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}
