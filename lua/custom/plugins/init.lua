-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'tpope/vim-fugitive' },

  { 'windwp/nvim-ts-autotag', opts = {} },

  {
    -- 'nvim-lualine/lualine.nvim',
    -- dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- opts = {
    --   options = {
    --     theme = 'auto',
    --     section_separators = '',
    --     component_separators = '',
    --     globalstatus = true,
    --   },
    -- },
  },

  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    config = function()
      -- Nvim-tree toggle shortcut
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'File Tree' })
      local function nvim_tree_on_attach(bufnr)
        local api = require 'nvim-tree.api'

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set('n', 's', api.node.open.vertical, opts 'Open in vertical split')
      end

      require('nvim-tree').setup {
        on_attach = nvim_tree_on_attach,
      }
    end,
  },

  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
}
