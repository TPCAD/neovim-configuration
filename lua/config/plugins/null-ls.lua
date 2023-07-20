return {
	"jose-elias-alvarez/null-ls.nvim",
	event = "BufRead",
	config = function()
		local null_ls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,

				-- c/cpp formater
				null_ls.builtins.formatting.clang_format,

				-- c/cpp linter
				-- null_ls.builtins.diagnostics.cpplint,
			},
			-- auto format on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
