-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- disable mini indentscope
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = {
-- 		"help",
-- 		"lazy",
-- 		"mason",
-- 		"toggleterm",
-- 		"lazyterm",
-- 		"NvimTree",
-- 	},
-- 	callback = function()
-- 		vim.b.miniindentscope_disable = true
-- 	end,
-- })
