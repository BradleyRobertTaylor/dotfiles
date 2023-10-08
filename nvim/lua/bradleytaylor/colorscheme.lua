local monokai = require("monokai-pro")

monokai.setup({
	filter = "spectrum",
	background_clear = { "telescope" },
})

monokai.load()

vim.cmd.colorscheme("monokai-pro")
