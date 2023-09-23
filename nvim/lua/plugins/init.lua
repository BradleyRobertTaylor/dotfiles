return {
	-- git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	{ "lewis6991/gitsigns.nvim", opts = {} },
	-- maximize splits
	{
		"szw/vim-maximizer",
		keys = {
			{ "<leader>sm", "<cmd>MaximizerToggle<cr>", desc = "Maximize split" },
		},
	},
	-- tmux for window split navigation
	{ "aserowy/tmux.nvim", opts = {} },
	-- colorscheme
	{
		"loctvl842/monokai-pro.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bradleytaylor.colors")
		end,
	},
	-- lualine statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				theme = "monokai-pro",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				globalstatus = true,
			},
		},
	},
	-- file tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("plugins.configs.neo-tree")
		end,
	},
	-- fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<C-f>", "<cmd>Telescope live_grep<cr>", desc = "Grep string" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
		},
	},
	-- syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/nvim-treesitter-context",
		},
		build = ":TSUpdate",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},
	-- convenient file navigation
	{
		"theprimeagen/harpoon",
		config = function()
			require("plugins.configs.harpoon")
		end,
	},
	{
		-- autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- snippet Engine & its associated nvim-cmp source
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp", -- adds LSP completion capabilities
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"rafamadriz/friendly-snippets", -- user friendly snippets
			"onsails/lspkind.nvim", -- vscode like icons for autocompletion
		},
		config = function()
			require("plugins.configs.nvim-cmp")
		end,
	},
	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", tag = "legacy", opts = {} }, -- status updates for LSP
			"jose-elias-alvarez/typescript.nvim",
			"nvimdev/lspsaga.nvim",
		},
		config = function()
			require("plugins.configs.lsp.lspconfig")
			require("plugins.configs.lsp.mason")
			require("plugins.configs.lsp.lspsaga")
		end,
	},
	-- formatters, linters, and diagnostics
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("plugins.configs.lsp.null-ls")
		end,
	},
	-- several modules (eg., pairs, surround, commenting, moving text...)
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("plugins.configs.mini")
		end,
	},
	{ "lukas-reineke/indent-blankline.nvim", opts = {} },
}
