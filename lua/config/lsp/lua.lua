local M = {}

M.setup = function(lspconfig, capabilities)
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	})
end

return M
