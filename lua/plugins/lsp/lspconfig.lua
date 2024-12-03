return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate", -- :MasonUpdate updates registry contents event = "VeryLazy",
      event = "VeryLazy",
      config = function()
        require("mason").setup()
      end,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      event = "VeryLazy",
      config = function() end,
    },
  },
  config = function()
    local on_attach = require("plugins.lsp.utils") -- keymaps

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local lspconfig = require("lspconfig")

    require("mason-lspconfig").setup()

    local servers = require("plugins.lsp.servers")
    for _, server in pairs(servers) do
      server.setup(lspconfig, capabilities, on_attach)
    end
  end,
}
