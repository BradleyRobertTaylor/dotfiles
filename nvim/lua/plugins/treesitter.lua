return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    'windwp/nvim-ts-autotag',
    'nvim-treesitter/nvim-treesitter-context',
  },
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = {
        'json',
        'javascript',
        'typescript',
        'tsx',
        'yaml',
        'html',
        'css',
        'markdown',
        'markdown_inline',
        'lua',
        'vim',
        'dockerfile',
        'gitignore',
        'go',
        'ruby',
        'graphql',
        'vimdoc',
      },

      -- Enable nvim-ts-autotag (use treesitter to autoclose and autorename html tags)
      autotag = { enable = true },

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })

    -- enable nvim-treesitter-context
    local treesitter_context = require('treesitter-context')

    vim.g.skip_ts_context_commentstring_module = true
    require('ts_context_commentstring').setup({
      enable_autocmd = false,
    })

    treesitter_context.setup({
      max_lines = 1, -- How many lines the window should span. Values <= 0 mean no limit.
    })
  end,
}
