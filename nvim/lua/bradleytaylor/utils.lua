local M = {}

M.nmap = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = desc })
end

M.cmd = function(command)
	return table.concat({ "<Cmd>", command, "<CR>" })
end

return M
