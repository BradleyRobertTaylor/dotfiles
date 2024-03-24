vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = require('bradleytaylor.utils').keymap
local cmd = require('bradleytaylor.utils').cmd

-- cursor settings
keymap('n', 'J', 'mzJ`z') -- keep cursor in place when appending next line
keymap('n', '<C-d>', '<C-d>zz') -- keep cursor in the middle when jumping by page
keymap('n', '<C-u>', '<C-u>zz') -- keep cursor in the middle when jumping by page
keymap('n', 'n', 'nzzzv') -- keep search terms in the middle
keymap('n', 'N', 'Nzzzv') -- keep search terms in the middle

-- clipboard settings
keymap('x', '<leader>p', [["_dP]]) -- paste over without losing current register
keymap({ 'n', 'v' }, '<leader>y', [["+y]]) -- yank to system clipboard
keymap('n', '<leader>Y', [["+Y]]) -- yank to system clipboard
keymap({ 'n', 'v' }, '<leader>d', [["_d]]) -- delete to void register
keymap('n', 'x', '"_x') -- delete single character without copying into register

-- window management
keymap('n', '<leader>|', '<C-w>v', 'Split window vertically')
keymap('n', '<leader>-', '<C-w>s', 'Split window horizotally')
keymap('n', '<leader>se', '<C-w>=', 'Equalize split width and heights')
keymap('n', '<leader>sx', cmd('close'), 'Close split')

-- toggle word wrap
keymap('n', '<leader>ww', cmd('set wrap!'), 'Toggle word wrap')
