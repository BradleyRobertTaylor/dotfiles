return {
  'christoomey/vim-tmux-navigator',
  'tpope/vim-surround',
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end,
  },
}
