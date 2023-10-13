local lspconfig = require("lspconfig")
local telescope = require("telescope.builtin")
local keymap = vim.keymap

-- Specify how the border looks like
local border = {
	{ "┌", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "┐", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "┘", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "└", "FloatBorder" },
	{ "│", "FloatBorder" },
}

-- Add the border on hover and on signature help popup window
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

-- Add border to the diagnostic popup window
vim.diagnostic.config({
	virtual_text = {
		prefix = "■ ", -- Could be '●', '▎', 'x', '■', , 
	},
	float = { border = border },
})

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

--------------------------------
-- Configure language servers --
--------------------------------

lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	handlers = handlers,
})

lspconfig["solargraph"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	handlers = handlers,
})

lspconfig["graphql"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	handlers = handlers,
	filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
})

lspconfig["marksman"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	handlers = handlers,
})

lspconfig["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	handlers = handlers,
})

lspconfig["tsserver"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	handlers = handlers,
})

lspconfig["jsonls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	handlers = handlers,
})

lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	handlers = handlers,
})

lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	handlers = handlers,
})

lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	handlers = handlers,
})

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	handlers = handlers,
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
