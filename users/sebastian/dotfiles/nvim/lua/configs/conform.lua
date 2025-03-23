local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = { "black" },     -- Sørg for at Python fungerer
    cpp = { "clang-format" }, -- Legg til C++ formatering
    c = { "clang-format" },   -- Hvis du ønsker det samme for C
  },

  format_on_save = {
    -- Disse opsjonene vil bli sendt til conform.format()
    timeout_ms = 500,
    lsp_fallback = true, -- Bruk LSP-formatting hvis ingen formattere er funnet
  },
}

return options
