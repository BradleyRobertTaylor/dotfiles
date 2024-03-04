local cmd = require("bradleytaylor.utils").cmd

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

		vim.keymap.set("n", "<leader>sm", cmd("WindowsMaximize"))
	end,
}
