local opt = vim.opt

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- vim.schedule
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
-- Enable break indent
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true
-- Set up undo and backup directories
vim.opt.undodir = vim.fn.stdpath 'data' .. '/undo' -- Undo history storage

-- Set custom backup directory inside Neovim's directory
local backup_dir = vim.fn.stdpath 'data' .. '/nvimbackup/'
if vim.fn.isdirectory(backup_dir) == 0 then
  vim.fn.mkdir(backup_dir, 'p')
end

-- Set up timestamped backup with an autocmd
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    -- Get the full path of the current file
    local file_path = vim.fn.expand '%:p'

    -- Only proceed if the file exists
    if vim.fn.filereadable(file_path) == 1 then
      -- Construct the backup file path
      local backup_file = backup_dir .. vim.fn.expand '%:t' .. '-' .. os.date '%d%m%Y-%S%M%H' .. '.bak'

      -- Read the file content and write to the backup file
      vim.fn.writefile(vim.fn.readfile(file_path), backup_file)
    end
  end,
})
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Set conceallevel for specific filetypes (like markdown or obsidian)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown', -- change this to your filetype if it's different
  callback = function()
    vim.opt_local.conceallevel = 1
    vim.opt_local.concealcursor = 'nc' -- (optional) conceal text in normal mode
  end,
})

--- kickstart above own below
--- kickstart above own below
--- kickstart above own below
--- kickstart above own below
--- kickstart above own below
--- kickstart above own below
--- kickstart above own below

opt.relativenumber = true

-- folding.lua
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = true -- Automatically enable folding
vim.opt.foldlevelstart = 99

-- Create an autocommand group for file-specific settings
local augroup = vim.api.nvim_create_augroup('MyFileTypeSettings', { clear = true })

-- Define settings for LaTeX and Markdown files
vim.api.nvim_create_autocmd('FileType', {
  group = augroup, -- Use the augroup created above
  pattern = { 'tex', 'markdown' }, -- Apply these settings to both LaTeX and Markdown files
  callback = function()
    vim.opt.textwidth = 80 -- Set textwidth to 80
    vim.opt.wrap = true -- Enable line wrapping
    vim.opt.spell = false -- Enable spell checking
    vim.opt.formatoptions:append 'tcq' -- Enable 'tcq' for formatting
  end,
})

-- Remap Ctrl+U to scroll up and center the cursor
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- Remap Ctrl+D to scroll down and center the cursor
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })

-- gjøre tabs mindre

-- Set the number of spaces a tab character represents
vim.opt.tabstop = 4 -- This controls the width of a tab character

-- Set the number of spaces for each step of (auto)indent
vim.opt.shiftwidth = 4 -- This controls the width for auto-indent

vim.cmd [[ autocmd BufNewFile,BufRead .gitignore set filetype=gitignore ]]

vim.opt.encoding = 'utf-8'

-- Functions
function LspDetach(name)
  for _, client in pairs(vim.lsp.get_clients { bufnr = 0 }) do
    if client.name == name then
      vim.lsp.buf_detach_client(0, client.id)
      print('Detached ' .. name)
      return
    end
  end
  print("LSP '" .. name .. "' not found on this buffer.")
end

vim.api.nvim_create_user_command('LspDetach', function(opts)
  LspDetach(opts.args)
end, { nargs = 1 })

vim.keymap.set('n', '<leader>dlt', function()
  LspDetach 'ts_ls'
end, { desc = 'Detach TypeScript LSP (tsserver)' })
vim.keymap.set('n', '<leader>dld', function()
  LspDetach 'denols'
end, { desc = 'Detach TypeScript LSP (tsserver)' })
