-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
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
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        section_separators = '',
        component_separators = '',
        globalstatus = true,
      },
    },
  },
}
