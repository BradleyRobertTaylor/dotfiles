return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			skip_confirm_for_simple_edits = true,
			keymaps = {
				["<C-p>"] = false,
			},
		})

		local cmd = require("bradleytaylor.utils").cmd
		vim.keymap.set("n", "-", cmd("Oil"), { desc = "Open file explorer" })
	end,
}
