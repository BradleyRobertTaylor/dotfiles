vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- cursor settings
vim.keymap.set("n", "J", "mzJ`z") -- keep cursor in place when appending next line
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- keep cursor in the middle when jumping by page
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- keep cursor in the middle when jumping by page
vim.keymap.set("n", "n", "nzzzv") -- keep search terms in the middle
vim.keymap.set("n", "N", "Nzzzv") -- keep search terms in the middle

-- clipboard settings
vim.keymap.set("x", "<leader>p", [["_dP]]) -- paste over without losing current register
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- yank to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete to void register
vim.keymap.set("n", "x", '"_x') -- delete single character without copying into register

-- replace all instances of the current word the cursor is on
vim.keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<cr>") -- close current split window

-- toggle word wrap
vim.keymap.set("n", "<leader>ww", "<cmd>set wrap!<cr>")
