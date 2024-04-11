return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- require('oil').setup({
    --   skip_confirm_for_simple_edits = true,
    --   prompt_save_on_select_new_entry = false,
    --   keymaps = {
    --     ['<C-p>'] = false,
    --   },
    -- })
    --
    -- local cmd = require('bradleytaylor.utils').cmd
    -- vim.keymap.set('n', '-', cmd('Oil'), { desc = 'Open file explorer' })
  end,
}
