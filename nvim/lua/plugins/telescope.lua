return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },
  config = function()
    require('telescope').setup({
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    })

    require('telescope').load_extension('ui-select')
    require('telescope').load_extension('fzf')

    local keymap = require('bradleytaylor.utils').keymap
    local builtin = require('telescope.builtin')

    keymap('n', '<leader>dl', builtin.diagnostics, 'Show diagnostics list')
    keymap('n', '<leader>sh', builtin.help_tags, 'Search help')
    keymap('n', '<leader>sk', builtin.keymaps, 'Search keymaps')
    keymap('n', '<C-p>', builtin.find_files, 'Search all files')
    keymap('n', '<leader>sw', builtin.grep_string, 'Search word under cursor')
    keymap('n', '<C-f>', builtin.live_grep, 'Grep all files')
    keymap('n', '<leader><leader>', builtin.buffers, 'Search existing buffers')
  end,
}
