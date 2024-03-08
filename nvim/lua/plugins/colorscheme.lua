return {
	-- {
	-- 	"bluz71/vim-moonfly-colors",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.opt.fillchars = {
	-- 			horiz = "━",
	-- 			horizup = "┻",
	-- 			horizdown = "┳",
	-- 			vert = "┃",
	-- 			vertleft = "┫",
	-- 			vertright = "┣",
	-- 			verthoriz = "╋",
	-- 		}
	--
	-- 		vim.g.moonflyNormalFloat = true
	-- 		vim.g.moonflyUndercurls = false
	-- 		vim.g.moonflyVirtualTextColor = true
	-- 		vim.g.moonflyWinSeparator = 2
	-- 		vim.g.moonflyTransparent = true
	-- 		vim.cmd.colorscheme("moonfly")
	-- 	end,
	-- },
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("carbonfox")
		end,
	},
}
