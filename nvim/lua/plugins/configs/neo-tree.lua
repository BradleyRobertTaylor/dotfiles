-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("neo-tree").setup({
	hijack_netrw_behavior = "open_current",
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle reveal<cr>")
