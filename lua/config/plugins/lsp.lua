return {
	"williamboman/mason-lspconfig.nvim",
	event = "VeryLazy",
	dependencies = {
		{
			"neovim/nvim-lspconfig",
			event = "VeryLazy",
			config = function() end,
		},
		{
			"williamboman/mason.nvim",
			build = ":MasonUpdate", -- :MasonUpdate updates registry contents
			event = "VeryLazy",
			config = function()
				require("mason").setup()
			end,
		},
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local lspconfig = require("lspconfig")
		require("mason-lspconfig").setup()
		require("config.lsp.lua").setup(lspconfig, capabilities)
		require("config.lsp.c").setup(lspconfig, capabilities)
	end,
}
