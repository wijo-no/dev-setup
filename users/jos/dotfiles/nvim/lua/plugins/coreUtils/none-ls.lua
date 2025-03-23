return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'mason.nvim',
    'nvimtools/none-ls-extras.nvim',
    -- 'davidmh/cspell.nvim',
  },
  config = function()
    local none_ls = require 'null-ls'
    -- local cspell = require 'cspell'

    none_ls.setup {
      sources = {
        --   cspell.diagnostics,
        --  cspell.code_actions,
      },
    }
  end,
}
