return {
  'christoomey/vim-tmux-navigator',
  'tpope/vim-surround',
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end,
  },
  'vim-test/vim-test'
}
