return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- ui = { enable = false },
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    ui = { enable = false },
    templates = {
      folder = '999_Templates',
      date_format = '%d-%m-%Y',
      time_format = '%H:%M',
    },

    disable_frontmatter = true,
    workspaces = {
      {
        name = 'personal',
        path = '/Users/jo-sebastian-salte-tinderholt/Documents/obsidianVault/',
      },
    },
  },

  vim.keymap.set('n', '<leader>ot', function()
    vim.cmd 'ObsidianTemplate'
  end, { desc = 'Obsidian Templates' }),
}
