local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)

for i = 1, 8 do
	vim.keymap.set("n", string.format("<space>%s", i), function()
		ui.nav_file(i)
	end)
end
