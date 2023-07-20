return {
	-- rust.vim
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},

	-- rust-tools
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		config = function()
			local on_attach = function(_, bufnr)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

				local nmap = function(modes, keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end
					vim.keymap.set(modes, keys, func, { buffer = bufnr, desc = desc })
				end

				-- Buffer
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				nmap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
				nmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
				nmap("n", "K", vim.lsp.buf.hover, "Hover")
				nmap("n", "gm", vim.lsp.buf.implementation, "Go to implementation")
				nmap("n", "<C-s>", vim.lsp.buf.signature_help, "Signature help")
				nmap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
				nmap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
				nmap("n", "<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, "List workspace folders")
				nmap("n", "<leader>D", vim.lsp.buf.type_definition, "Type definition")
				nmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
				nmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
				nmap("n", "gr", vim.lsp.buf.references, "Go to references")
				nmap("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, "Format")
			end
			local opts = {
				tools = {
					runnables = {
						use_telescope = true,
					},
					inlay_hints = {
						auto = true,
						show_parameter_hints = false,
						parameter_hints_prefix = "",
						other_hints_prefix = "",
					},
				},

				server = {
					-- on_attach is a callback called when the language server attachs to the buffer
					on_attach = on_attach,
					settings = {
						-- to enable rust-analyzer settings visit:
						-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
						["rust-analyzer"] = {
							-- enable clippy on save
							checkOnSave = {
								command = "clippy",
							},
						},
					},
				},
			}
			require("rust-tools").setup(opts)
		end,
	},
}
