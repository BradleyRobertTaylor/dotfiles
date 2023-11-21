require("telescope").load_extension("fzf")

require("telescope").setup({
	borderchars = {
		prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
		results = { " " },
		preview = { " " },
	},
})
