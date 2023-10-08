return {
	-- git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	{ "lewis6991/gitsigns.nvim", opts = {} },
	-- surrounds
	"tpope/vim-surround",
	-- visualize undo history
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
		},
	},
	-- maximize splits
	{
		"szw/vim-maximizer",
		keys = {
			{ "<leader>sm", "<cmd>MaximizerToggle<cr>", desc = "Maximize split" },
		},
	},
	-- colorscheme
	{
		"bluz71/vim-moonfly-colors",
		lazy = false,
		priority = 1000,
		config = function()
			require("bradleytaylor.colorscheme")
		end,
	},
	-- lualine statusline
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plugins.configs.lualine")
		end,
	},
	-- file tree
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle file explorer" },
		},
		config = function()
			require("plugins.configs.nvim-tree")
		end,
	},
	-- fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		-- or                              , branch = '0.1.x',
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<C-f>", "<cmd>Telescope live_grep<cr>", desc = "Grep string" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
		},
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	-- syntax highlighting, autoclose html tags, show current context
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
			-- snippet engine & its associated nvim-cmp source
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
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("plugins.configs.lsp.lspconfig")
			require("plugins.configs.lsp.mason")
		end,
	},
	-- formatters, linters, and diagnostics
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.configs.conform")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.configs.lint")
		end,
	},
	-- various utilities (commenting, pairs, moving text, etc...)
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("plugins.configs.mini")
		end,
	},
	-- better looking ui for vim.ui.select and vim.ui.input
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	-- manage splits
	{
		"mrjones2014/smart-splits.nvim",
		config = function()
			require("plugins.configs.smart-splits")
		end,
	},
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("plugins.configs.noice")
		end,
	},
}
