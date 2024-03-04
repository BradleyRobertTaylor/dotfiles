-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local nmap = require("bradleytaylor.utils").nmap
		require("neo-tree").setup({
			hijack_netrw_behavior = "open_current",
		})

		nmap("<leader>e", "<cmd>Neotree toggle reveal<cr>", "Open File [E]xplorer")
	end,
}
