return {
  {
    -- 'tiagovla/tokyodark.nvim',
    'bluz71/vim-moonfly-colors',
    priority = 1000,
    config = function()
      -- require('tokyodark').setup({
      --   custom_palette = {
      --     bg0 = '#000000',
      --   },
      -- })
      -- vim.cmd('colorscheme tokyodark')

      -- moonfly theme config
      vim.g.moonflyNormalFloat = true
      vim.g.moonflyUndercurls = false
      vim.g.moonflyVirtualTextColor = true
      vim.g.moonflyWinSeparator = 2
      vim.g.moonflyTransparent = true
      vim.cmd.colorscheme('moonfly')
    end,
  },
}
