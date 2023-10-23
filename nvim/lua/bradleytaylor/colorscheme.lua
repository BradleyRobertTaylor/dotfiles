-- require("catppuccin").setup({
-- 	flavour = "mocha", -- latte, frappe, macchiato, mocha
-- 	color_overrides = {
-- 		mocha = {
-- 			base = "#000000",
-- 			mantle = "#000000",
-- 			crust = "#000000",
-- 		},
-- 	},
-- 	integrations = {
-- 		fidget = true,
-- 		harpoon = true,
-- 		mason = true,
-- 		cmp = true,
-- 		gitsigns = true,
-- 		nvimtree = true,
-- 		treesitter = true,
-- 		mini = true,
-- 	},
-- })

vim.opt.fillchars = {
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┫",
	vertright = "┣",
	verthoriz = "╋",
}

vim.g.moonflyNormalFloat = true
vim.g.moonflyUndercurls = false
vim.g.moonflyVirtualTextColor = true
vim.g.moonflyWinSeparator = 2
vim.g.moonflyTransparent = true
vim.cmd.colorscheme("moonfly")
