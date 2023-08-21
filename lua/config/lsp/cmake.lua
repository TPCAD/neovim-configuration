local M = {}

M.setup = function(lspconfig, capabilities, on_attach)
  lspconfig.cmake.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
