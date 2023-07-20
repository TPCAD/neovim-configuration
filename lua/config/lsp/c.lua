local M = {}

M.setup = function(lspconfig, capabilities, on_attach)
	lspconfig.clangd.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return M
