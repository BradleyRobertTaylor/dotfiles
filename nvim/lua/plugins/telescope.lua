return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	config = function()
		require("telescope").setup({
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
				preview = { " " },
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension("ui-select"))
		pcall(require("telescope").load_extension("fzf"))

		local keymap = require("bradleytaylor.utils").keymap
		local builtin = require("telescope.builtin")

		keymap("n", "<leader>dl", builtin.diagnostics, "[D]iagnostics [L]ist")
		keymap("n", "<leader>sh", builtin.help_tags, "[S]earch [H]elp")
		keymap("n", "<leader>sk", builtin.keymaps, "[S]earch [K]eymaps")
		keymap("n", "<C-p>", builtin.find_files, "Search all files")
		keymap("n", "<leader>sw", builtin.grep_string, "[S]earch current [W]ord")
		keymap("n", "<C-f>", builtin.live_grep, "[S]earch by [G]rep")
		keymap("n", "<leader><leader>", builtin.buffers, "Search existing buffers")
	end,
}
