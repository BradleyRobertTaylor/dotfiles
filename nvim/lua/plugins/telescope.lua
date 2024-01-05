return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.2",
	-- or                              , branch = '0.1.x',
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<C-f>", "<cmd>Telescope live_grep<cr>", desc = "Grep string" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
	},
	config = function()
		require("telescope").load_extension("fzf")

		require("telescope").setup({
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
				preview = { " " },
			},
		})
	end,
}
