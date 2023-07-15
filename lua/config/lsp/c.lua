local M = {}

M.setup = function(lspconfig, capabilities)
	lspconfig.clangd.setup({
		capabilities = capabilities,
	})
end

return M
