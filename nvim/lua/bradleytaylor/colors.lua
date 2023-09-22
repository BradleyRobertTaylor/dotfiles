-- require("catppuccin").setup({
-- 	flavour = "mocha", -- latte, frappe, macchiato, mocha
-- 	color_overrides = {
-- 		mocha = {
-- 			base = "#11111b",
-- 		},
-- 	},
-- 	integrations = {
-- 		cmp = true,
-- 		gitsigns = true,
-- 		neotree = true,
-- 		treesitter = true,
-- 		mason = true,
-- 		fidget = true,
-- 		harpoon = true,
-- 		mini = true,
-- 		telescope = true,
-- 		alpha = true,
-- 	},
-- })
--
-- vim.cmd.colorscheme("catppuccin")

require("monokai-pro").setup({
	filter = "spectrum",
	background_clear = { "telescope", "notify" },
})

vim.cmd.colorscheme("monokai-pro")
