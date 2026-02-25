return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  {
    'smoka7/hop.nvim',
    version = '*',
    opts = {},
    -- This 'config' function runs when the plugin loads
    config = function(_, opts)
      local hop = require 'hop'
      -- First, run the setup with the opts defined above
      hop.setup(opts)

      -- Now, define your custom keymaps
      local directions = require('hop.hint').HintDirection

      vim.keymap.set('', '<leader>w', function() hop.hint_words { direction = directions.AFTER_CURSOR, current_line_only = true } end, { remap = true })

      vim.keymap.set('', '<leader>b', function() hop.hint_words { direction = directions.BEFORE_CURSOR, current_line_only = true } end, { remap = true })
    end,
  },
}
