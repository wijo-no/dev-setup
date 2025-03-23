-- Laster nødvendige moduler
local lspconfig = require "lspconfig"
local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"

-- Konfigurer Mason (pakkehåndtering for LSP, DAP, Linters, Formatters)
mason.setup()

-- Installer nødvendige LSP-servere
mason_lspconfig.setup {
  ensure_installed = { "html", "cssls", "ts_ls", "pyright" }, -- Pass på at "clangd" er med!
}

-- Standardfunksjon for når en LSP starter
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
end

-- Definer capabilities (for å få bedre autocompletion)
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Håndter oppsett for alle LSP-servere
mason_lspconfig.setup_handlers {
  function(server_name)
    if server_name == "clangd" then
      lspconfig.clangd.setup {
        cmd = { "/run/current-system/sw/bin/clangd" }, -- Bruk systemets `clangd`
        on_attach = on_attach,
        capabilities = capabilities,
      }
    else
      lspconfig[server_name].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end
  end,
}

lspconfig.clangd.setup {
  cmd = { "/run/current-system/sw/bin/clangd" }, -- Bruk systemets `clangd`
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Oppsett for TypeScript (tsserver)
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Oppsett for Python (pyright)
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Oppsett for CSS (cssls)
lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Oppsett for HTML
lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
