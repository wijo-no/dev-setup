return {
  'glacambre/firenvim',
  build = ':call firenvim#install(0)',
  config = function()
    if vim.g.started_by_firenvim then
      vim.api.nvim_create_autocmd('UIEnter', {
        callback = function()
          vim.o.lines = 15 -- Adjust this to your preferred height
        end,
      })
    end
  end,
}
