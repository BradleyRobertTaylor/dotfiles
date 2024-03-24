return {
  {
    'tiagovla/tokyodark.nvim',
    priority = 1000,
    config = function()
      require('tokyodark').setup({
        custom_palette = {
          bg0 = '#000000',
        },
      })
      vim.cmd.colorscheme('tokyodark')
    end,
  },
}
