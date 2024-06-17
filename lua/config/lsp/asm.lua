local M = {}

M.setup = function(lspconfig, capabilities, on_attach)
  lspconfig.asm_lsp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
