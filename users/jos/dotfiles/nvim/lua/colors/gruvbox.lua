-- gruvbox.lua

return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000, -- Load this before other plugins
  opts = {
    terminal_colors = true,
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = true,
      emphasis = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- Invert background for search, diffs, statuslines, and errors
    contrast = '', -- Can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {
      -- Markdown Header Background Overrides with Foreground Colors
      -- ['DiffText'] = { fg = '', bg = '' },
      NormalFloat = { bg = '#504945' }, -- Set a non-transparent background
      FloatBorder = { bg = '#504945', fg = '#d79921' }, -- Match border background with NormalFloat
      CursorLine = { bg = 'NONE' }, -- Make cursor line transparen
    },
    dim_inactive = false,
    transparent_mode = true,
  },
  init = function()
    vim.cmd.colorscheme 'gruvbox'
    vim.cmd 'set nocursorline'
    -- Autocommand to apply Markdown-specific highlights
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        -- Markdown-specific heading highlights
        vim.api.nvim_set_hl(0, '@markup.heading.1.markdown', { fg = '#fb4934', bg = '', bold = true })
        vim.api.nvim_set_hl(0, '@markup.heading.2.markdown', { fg = '#fabd2f', bg = '', bold = true })
        vim.api.nvim_set_hl(0, '@markup.heading.3.markdown', { fg = '#b8bb26', bg = '', bold = true })
        vim.api.nvim_set_hl(0, '@markup.heading.4.markdown', { fg = '#8ec07c', bg = '', bold = true })
        vim.api.nvim_set_hl(0, '@markup.heading.5.markdown', { fg = '#83a598', bg = '', bold = true })
        vim.api.nvim_set_hl(0, '@markup.heading.6.markdown', { fg = '#d3869b', bg = '', bold = true })

        -- DiffAdd and other Diff groups specifically for Markdown
        -- vim.api.nvim_set_hl(0, 'DiffAdd', { fg = '', bg = '' })
        -- vim.api.nvim_set_hl(0, 'DiffChange', { fg = '', bg = '' })
        -- vim.api.nvim_set_hl(0, 'DiffDelete', { fg = '', bg = '' })
      end,
    })
  end,
}
