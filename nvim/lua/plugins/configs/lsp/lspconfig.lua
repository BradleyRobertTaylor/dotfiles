-- Setup language servers.
local lspconfig = require("lspconfig")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev")
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next")
vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<cr>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf }

		vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
		vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga goto_type_definition<cr>", opts)
		vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, opts)
		vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts)
		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
		-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)

		-- Format file with LSP
		vim.keymap.set("n", "F", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
})

-- configure go server
lspconfig["gopls"].setup({
	capabilities = capabilities,
})

-- configure typescript server with plugin
require("typescript").setup({
	server = {
		capabilities = capabilities,
	},
})

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
