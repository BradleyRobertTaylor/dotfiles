return {
  'bluz71/vim-moonfly-colors',
  priority = 1000,
  config = function()
    vim.g.moonflyUndercurls = false
    vim.g.moonflyVirtualTextColor = true
    vim.g.moonflyWinSeparator = 2
    vim.g.moonflyTransparent = true
    vim.cmd.colorscheme 'moonfly'
  end,
}
