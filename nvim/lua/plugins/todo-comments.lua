return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local keymap = require("bradleytaylor.utils").keymap
		require("todo-comments").setup({})

		keymap("n", "]t", function()
			require("todo-comments").jump_next()
		end, "Next todo comment")

		keymap("n", "[t", function()
			require("todo-comments").jump_prev()
		end, "Previous todo comment")
	end,
}
