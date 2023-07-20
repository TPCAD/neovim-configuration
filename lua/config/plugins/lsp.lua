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
			build = ":MasonUpdate", -- :MasonUpdate updates registry contents event = "VeryLazy",
			config = function()
				require("mason").setup()
			end,
		},
	},
	config = function()
		local servers = {
			"lua",
			"c",
		}

		local on_attach = require("config.utils.lsp-on-attach")

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local lspconfig = require("lspconfig")

		require("mason-lspconfig").setup()

		for _, server in pairs(servers) do
			require("config.lsp." .. server).setup(lspconfig, capabilities, on_attach)
		end
	end,
}
