-- tokyonight.lua

return {
  'folke/tokyonight.nvim',
  priority = 1000,
  opts = {
    style = 'day', -- Available styles: storm, night, day, moon
    transparent = true,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      sidebars = 'light',
      floats = 'light',
    },
  },
  init = function()
    vim.cmd.colorscheme 'tokyonight'
  end,
}
