local M = {}

M.setup = function(lspconfig, capabilities, on_attach)
	lspconfig.pyright.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	lspconfig.jedi_language_server.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return M
