local lspconfig = require("lspconfig")
local telescope = require("telescope.builtin")
local keymap = vim.keymap

-- add borders to lsp and diagnostic windows
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
-- vim.diagnostic.config({
-- 	float = {
-- 		border = "rounded",
-- 	},
-- })

local on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- diagnostics
	keymap.set("n", "<leader>dl", telescope.diagnostics, opts) -- show diagnostics for file
	keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- line diagnostics
	keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to prev diagnostic
	keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic

	keymap.set("n", "gr", telescope.lsp_references, opts) -- show lsp references
	keymap.set("n", "gd", telescope.lsp_definitions, opts) -- go to definition
	keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
	keymap.set("n", "gi", telescope.lsp_implementations, opts) -- show lsp implementations
	keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- show code actions
	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
	keymap.set("n", "K", vim.lsp.buf.hover, opts) -- hover docs
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- change diagnostic symbols
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["tsserver"].setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

lspconfig["jsonls"].setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
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
