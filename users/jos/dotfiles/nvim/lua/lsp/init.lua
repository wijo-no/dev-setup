-- lua/custom/lsp/init.lua

-- Import all LSP-related plugin configurations
return {
  { import = 'lsp.lspconfig' },
  { import = 'lsp.conform' },
  { import = 'lsp.nvim-cmp' },
}
