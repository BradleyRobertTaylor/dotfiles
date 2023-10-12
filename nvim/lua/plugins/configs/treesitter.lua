require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"go",
		"ruby",
		"graphql",
	},

	-- Enable nvim-ts-autotag (use treesitter to autoclose and autorename html tags)
	autotag = {
		enable = true,
	},

	-- Enable nvim-ts-context-commentstring
	context_commentstring = {
		enable = true,
		enable_autocmd = false, -- integration with Mini.comment
	},

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})

-- enable nvim-treesitter-context
local treesitter_context = require("treesitter-context")

treesitter_context.setup({
	max_lines = 1, -- How many lines the window should span. Values <= 0 mean no limit.
})

vim.keymap.set("n", "[c", function()
	treesitter_context.go_to_context()
end, { silent = true })
