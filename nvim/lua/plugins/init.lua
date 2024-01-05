return {
	-- colorschemes
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"bluz71/vim-moonfly-colors",
		lazy = false,
		priority = 1000,
		config = function()
			require("bradleytaylor.colorscheme")
		end,
	},
	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", tag = "legacy", event = "LspAttach", opts = {} }, -- lsp status updates
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"b0o/schemastore.nvim", -- access to schemastore catalog for json
		},
		config = function()
			require("plugins.lsp.lspconfig")
			require("plugins.lsp.mason")
		end,
	},
	-- git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	-- tmux split integration movement
	{ "christoomey/vim-tmux-navigator", lazy = false },
	-- surrounds
	"tpope/vim-surround",
	-- visualize undo history
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
		},
	},
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		opts = {},
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
}
