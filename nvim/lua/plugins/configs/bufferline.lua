require("bufferline").setup({
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				highlight = "Directory",
				separator = true, -- use a "true" to enable the default, or set your own character
			},
		},
		numbers = function(number_opts)
			local harpoon = require("harpoon.mark")
			local buf_name = vim.api.nvim_buf_get_name(number_opts.id)
			local harpoon_mark = harpoon.get_index_of(buf_name)
			return harpoon_mark
		end,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or ""
			return " " .. icon .. count
		end,
	},
})

vim.keymap.set("n", "bh", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "bl", "<cmd>BufferLineCycleNext<cr>")
