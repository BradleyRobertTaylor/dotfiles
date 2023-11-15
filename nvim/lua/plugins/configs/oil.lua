require("oil").setup()

vim.keymap.set("n", "e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
