return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon"):setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end)

		vim.keymap.set("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		for i = 1, 8 do
			vim.keymap.set("n", string.format("<space>%s", i), function()
				harpoon:list():select(i)
			end)
		end
	end,
}
