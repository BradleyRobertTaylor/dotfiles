local mason = require("mason")
local mason_null_ls = require("mason-null-ls")
local mason_lspconfig = require("mason-lspconfig")

mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
    "tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"gopls",
		"solargraph",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
  ensure_installed = {
    "prettierd",
    "stylua",
    "eslint_d",
  },
})
