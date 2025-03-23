return {
  { -- Compiler.nvim plugin
    'Zeioth/compiler.nvim',
    cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
    dependencies = { 'stevearc/overseer.nvim', 'nvim-telescope/telescope.nvim' },
    opts = {},
    keys = {
      { '<leader>co', '<cmd>CompilerOpen<CR>', desc = 'Open Compiler' },
      { '<leader>ct', '<cmd>CompilerToggleResults<CR>', desc = 'Toggle Compiler Results' },
      { '<leader>cr', '<cmd>CompilerRedo<CR>', desc = 'Redo Compiler' },
    },
  },
  { -- overseer.nvim plugin
    'stevearc/overseer.nvim',
    commit = '6271cab7ccc4ca840faa93f54440ffae3a3918bd',
    cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
    opts = {
      task_list = {
        direction = 'bottom',
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
}
