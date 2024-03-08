return {
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				theme = "carbonfox",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				-- globalstatus = true,
			},
		},
	},
}
