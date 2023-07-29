local keymap = vim.keymap

----------------------
-- General Keymaps
----------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- move blocks of text
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cursor settings
keymap.set("n", "J", "mzJ`z") -- keep cursor in place when appending next line
keymap.set("n", "<C-d>", "<C-d>zz") -- keep cursor in the middle when jumping by page
keymap.set("n", "<C-u>", "<C-u>zz") -- keep cursor in the middle when jumping by page
keymap.set("n", "n", "nzzzv") -- keep search terms in the middle
keymap.set("n", "N", "Nzzzv") -- keep search terms in the middle

-- clipboard settings
keymap.set("x", "<leader>p", [["_dP]]) -- paste over without losing current register
keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- yank to system clipboard
keymap.set("n", "<leader>Y", [["+Y]]) -- yank to system clipboard
keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete to void register
keymap.set("n", "x", '"_x') -- delete single character without copying into register

-- replace all instances of the current word the cursor is on
keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
