vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

require("luasnip.loaders.from_lua").load { paths = "~/.config/nvim/lua/snippets/" }
vim.schedule(function()
  require "mappings"
end)

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.opt.breakindent = true

vim.opt.ignorecase = true

vim.opt.smartcase = true
-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

vim.api.nvim_set_keymap("t", "<leader><ESC>", [[<C-\><C-n>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap(
  "n",
  "<leader>sf",
  "<cmd>Telescope find_files hidden=true<CR>",
  { noremap = true, silent = true }
)

local null_ls = require "null-ls"

null_ls.setup {
  sources = {
    -- Legg til Python formatteren
    null_ls.builtins.formatting.black.with {
      extra_args = { "--fast" },
    },
    -- Andre formatters hvis nødvendig
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = "LspFormatting", buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.cpp", -- Bare for C++-filer
  callback = function()
    require("conform").format {
      timeout_ms = 500,
      lsp_fallback = true,
    }
  end,
})

-- Hvis du også vil formatere C-filer
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.c", -- Bare for C-filer
  callback = function()
    require("conform").format {
      timeout_ms = 500,
      lsp_fallback = true,
    }
  end,
})

vim.o.undodir = os.getenv "HOME" .. "/.local/state/nvim/undo"
vim.o.undofile = true
-- Define settings for LaTeX and Markdown files
vim.api.nvim_create_autocmd("FileType", {
  group = augroup, -- Use the augroup created above
  pattern = { "tex", "markdown" }, -- Apply these settings to both LaTeX and Markdown files
  callback = function()
    vim.opt.textwidth = 80 -- Set textwidth to 80
    vim.opt.wrap = true -- Enable line wrapping
    vim.opt.spell = false -- Enable spell checking
    vim.opt.formatoptions:append "tcq" -- Enable 'tcq' for formatting
  end,
})
