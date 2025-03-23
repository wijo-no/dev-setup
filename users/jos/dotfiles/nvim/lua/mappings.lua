require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-l>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")

vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { silent = true, desc = "Move left" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { silent = true, desc = "Move right" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { silent = true, desc = "Move down" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { silent = true, desc = "Move up" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- |
--
vim.keymap.set("n", "<leader>e", function()
  vim.diagnostic.open_float()
  vim.diagnostic.open_float() -- Call it twice to focus the float
end, { desc = "Open error under cursor" })

vim.keymap.set("n", "<leader>go", function()
  require("snacks").gitbrowse.open()
end, { desc = "Open file in browser" })

vim.keymap.set("n", "<leader>gr", function()
  require("snacks").gitbrowse.open { what = "repo" }
end, { desc = "Open repo in browser" })

vim.keymap.set("n", "<leader>gg", function()
  require("snacks").lazygit.open()
end, { desc = "Open LazyGit" })

vim.keymap.set("n", "<leader>gl", function()
  require("snacks").lazygit.log()
end, { desc = "Git log in LazyGit" })

vim.keymap.set("n", "<leader>gf", function()
  require("snacks").lazygit.log_file()
end, { desc = "File Git log in LazyGit" })

-- Åpne kompileren med <leader>c
vim.api.nvim_set_keymap("n", "<leader>co", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Stopp og restart siste kompileringsoppgave med <leader>r
vim.api.nvim_set_keymap(
  "n",
  "<leader>r",
  "<cmd>CompilerStop<cr><cmd>CompilerRedo<cr>",
  { noremap = true, silent = true }
)

-- Toggle compiler results med <leader>t
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

local dap = require "dap"

vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Add breakpoint at line" })
vim.keymap.set("n", "<leader>dr", "<cmd>DapContinue<CR>", { desc = "Start or continue debugging" })

vim.keymap.set("n", "<leader>ds", function()
  dap.step_over()
end, { desc = "Step over" })
vim.keymap.set("n", "<leader>di", function()
  dap.step_into()
end, { desc = "Step into" })
vim.keymap.set("n", "<leader>do", function()
  dap.step_out()
end, { desc = "Step out" })
vim.keymap.set("n", "<leader>dq", function()
  require("dap").terminate()
end, { desc = "Terminate debugger" })

vim.keymap.del("n", "<C-W>d")
-- Remap Ctrl+U to scroll up and center the cursor
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- Remap Ctrl+D to scroll down and center the cursor
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
