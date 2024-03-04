local nmap = require("bradleytaylor.utils").nmap

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon"):setup()

		nmap("<leader>a", function()
			harpoon:list():append()
		end, "Add file to Harpoon list")

		vim.keymap.set("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		for i = 1, 8 do
			nmap(string.format("<space>%s", i), function()
				harpoon:list():select(i)
			end, string.format("Go to Harpoon List %s", i))
		end
	end,
}
