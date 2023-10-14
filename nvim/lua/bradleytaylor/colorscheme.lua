require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	color_overrides = {
		mocha = {
			base = "#11111b",
		},
	},
	integrations = {
		fidget = true,
		harpoon = true,
		mason = true,
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		mini = true,
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
