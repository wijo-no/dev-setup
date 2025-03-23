return {
  'NeogitOrg/neogit',
  config = function()
    vim.keymap.set('n', '<leader>go', function()
      vim.cmd 'Neogit'
    end, { desc = 'Open Neogit' })
  end,
}
