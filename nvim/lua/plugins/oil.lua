return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup({
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = false,
      keymaps = {
        ['<C-p>'] = false,
      },
    })

    vim.keymap.set('n', '-', vim.cmd.Oil, { desc = 'Open file explorer' })
  end,
}
