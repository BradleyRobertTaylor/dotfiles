require("telescope").load_extension("fzf")

require("telescope").setup({
	-- show hidden files
	pickers = {
		find_files = {
			hidden = true,
		},
	},
	borderchars = {
		prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
		results = { " " },
		preview = { " " },
	},
})
