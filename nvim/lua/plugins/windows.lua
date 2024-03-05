local utils = require("bradleytaylor.utils")

return {
	"anuvyklack/windows.nvim",
	dependencies = { "anuvyklack/middleclass" },
	config = function()
		require("windows").setup({
			autowidth = {
				enable = false,
			},
			animation = {
				enable = false,
			},
		})

		utils.nmap("<leader>sm", utils.cmd("WindowsMaximize"), "Toggle window maximizer")
	end,
}
