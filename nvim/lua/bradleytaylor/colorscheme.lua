-- require("catppuccin").setup({
-- 	flavour = "mocha", -- latte, frappe, macchiato, mocha
-- 	color_overrides = {
-- 		-- mocha = {
-- 		-- 	base = "#11111b",
-- 		-- },
-- 	},
-- 	integrations = {
-- 		cmp = true,
-- 		gitsigns = true,
-- 		treesitter = true,
-- 		mason = true,
-- 		fidget = true,
-- 		harpoon = true,
-- 		mini = true,
-- 		telescope = true,
-- 		nvimtree = true,
-- 	},
-- })
--
-- vim.cmd.colorscheme("catppuccin")

require("one_monokai").setup({
	-- transparent = true,
	colors = {
		bg = "#000000",
		-- vulcan = "#1e2024",
	},
})

vim.cmd.colorscheme("one_monokai")
