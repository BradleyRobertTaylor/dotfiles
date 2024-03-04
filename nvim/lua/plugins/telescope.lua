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
		pcall(require("telescope").load_extension("fzf"))
		pcall(require("telescope").load_extension("ui-select"))

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

		local nmap = require("bradleytaylor.utils").nmap
		local builtin = require("telescope.builtin")

		nmap("<leader>dl", builtin.diagnostics, "[D]iagnostics [L]ist")
		nmap("<leader>sh", builtin.help_tags, "[S]earch [H]elp")
		nmap("<leader>sk", builtin.keymaps, "[S]earch [K]eymaps")
		nmap("<C-p>", builtin.find_files, "[S]earch [F]iles")
		nmap("<leader>ss", builtin.builtin, "[S]earch [S]elect Telescope")
		nmap("<leader>sw", builtin.grep_string, "[S]earch current [W]ord")
		nmap("<C-f>", builtin.live_grep, "[S]earch by [G]rep")
		nmap("<leader>sr", builtin.resume, "[S]earch [R]esume")
		nmap("<leader>s.", builtin.oldfiles, '[S]earch Recent Files ("." for repeat)')
		nmap("<leader><leader>", builtin.buffers, "[ ] Find existing buffers")
	end,
}
