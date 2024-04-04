return {
  'anuvyklack/windows.nvim',
  dependencies = { 'anuvyklack/middleclass' },
  config = function()
    local cmd = require('bradleytaylor.utils').cmd
    local keymap = require('bradleytaylor.utils').keymap

    require('windows').setup({
      autowidth = {
        enable = false,
      },
      animation = {
        enable = false,
      },
    })

    keymap('n', '<leader>sm', cmd('WindowsMaximize'), 'Toggle window maximizer')
  end,
}
