return {
  "stevearc/conform.nvim",
  dependencies = { "williamboman/mason.nvim" },
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      lua = { "stylua" },
    },
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
  },
}
