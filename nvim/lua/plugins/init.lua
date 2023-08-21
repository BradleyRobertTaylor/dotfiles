return {
	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	-- Edit "surroundings" (parantheses, brackets, tags, etc...)
	"tpope/vim-surround",
	-- Maximize splits
	{
		"szw/vim-maximizer",
		config = function()
			vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
		end,
	},
	-- Tmux for window split navigation
	{
		"aserowy/tmux.nvim",
		config = function()
			require("tmux").setup()
		end,
	},
	-- Colorscheme
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bradleytaylor.colors")
		end,
	},
	-- Lualine statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				theme = "catppuccin",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				globalstatus = true,
			},
		},
	},
	-- File tree
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
	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.configs.telescope")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
		},
		build = ":TSUpdate",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},
	{
		"theprimeagen/harpoon",
		config = function()
			require("plugins.configs.harpoon")
		end,
	},
	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
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
	-- startup dashboard
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.configs.alpha")
		end,
	},
	-- several modules (eg., pairs, indent context, commenting...)
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("plugins.configs.mini")
		end,
	},
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
}
