return {
  {
    'ibhagwan/fzf-lua',
    event = 'VeryLazy',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local actions = require 'fzf-lua.actions'
      -- calling `setup` is optional for customization
      require('fzf-lua').setup {
        lsp = {
          async_or_timeout = false,
          severity = 'Warning',
          actions = {
            ['default'] = actions.file_edit_or_qf,
            ['ctrl-q'] = actions.file_sel_to_qf,
          },
        },
        -- colorscheme = 'onedark',
        vim.keymap.set('n', '<c-P>', "<cmd>lua require('fzf-lua').files()<CR>", { silent = true }),
        -- vim.keymap.set('n', '<leader>b', "<cmd>lua require('fzf-lua').buffers()<CR>", { desc = 'Fuzzy find recent files' }),
        vim.keymap.set('n', 'gn', ':FzfLua lsp_references<CR>'),
      }
    end,
  },
}
