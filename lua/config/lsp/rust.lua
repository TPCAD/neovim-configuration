local M = {}

M.setup = function(lspconfig, capabilities)
  lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    cmd = { "rust-analyzer" },
  })
end

return M
