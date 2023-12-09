local function cmd(command)
	return table.concat({ "<Cmd>", command, "<CR>" })
end

require("windows").setup({
	autowidth = {
		enable = false,
	},
	animation = {
		enable = false,
	},
})

vim.keymap.set("n", "<leader>sm", cmd("WindowsMaximize"))
