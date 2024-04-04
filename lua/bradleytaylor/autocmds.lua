vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Open help docs in a vertical split',
  group = vim.api.nvim_create_augroup('VerticalHelp', { clear = true }),
  pattern = 'help',
  callback = function()
    vim.bo.bufhidden = 'unload'
    vim.cmd('wincmd L')
    vim.cmd('=')
  end,
})
