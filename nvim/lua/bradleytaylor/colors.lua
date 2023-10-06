require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	color_overrides = {
		mocha = {
			-- base = "#11111b",
			base = "#000000",
		},
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		treesitter = true,
		mason = true,
		fidget = true,
		harpoon = true,
		mini = true,
		telescope = true,
		nvimtree = true,
	},
})

vim.cmd.colorscheme("catppuccin")
