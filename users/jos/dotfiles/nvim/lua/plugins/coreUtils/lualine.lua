-- lua/plugins/lualine.lua
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'gruvbox',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 150,
          tabline = 150,
          winbar = 150,
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },

        lualine_c = {
          {
            function()
              local file_dir = vim.fn.fnamemodify(vim.fn.expand '%:p:h', ':t') -- Get the directory of the current file
              local filename = vim.fn.expand '%:t' -- Get current file name
              return file_dir .. '/' .. filename
            end,
            cond = function()
              return vim.fn.expand '%:t' ~= '' -- Only show when a file is open
            end,
          },
        },

        lualine_x = {
          'encoding',
          'fileformat',
          'filetype',
          {
            function()
              local rec = vim.fn.reg_recording()
              if rec ~= '' then
                return 'Recording @' .. rec
              else
                return ''
              end
            end,
            cond = function()
              return vim.fn.reg_recording() ~= ''
            end,
            color = { fg = '#ff9e64' },
          },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
