return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.comment').setup({
      options = {
        -- integrate with nvim-ts-comment-context-commentstring
        custom_commentstring = function()
          return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
        end,
      },
    })

    local MiniFiles = require('mini.files')
    MiniFiles.setup()

    local minifiles_toggle = function()
      if not MiniFiles.close() then
        MiniFiles.open()
      end
    end

    vim.keymap.set('n', '<leader>e', minifiles_toggle, { desc = 'Open file explorer' })

    require('mini.surround').setup()

    require('mini.move').setup({
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Move in Visual mode
        left = '<',
        right = '>',
        down = 'J',
        up = 'K',

        -- Move current line in Normal mode
        line_left = '<',
        line_right = '>',
      },

      -- Options which control moving behavior
      options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = true,
      },
    })
  end,
}
