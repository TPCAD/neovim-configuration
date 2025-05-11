return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  dependencies = {
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate", -- :MasonUpdate updates registry contents event = "VeryLazy",
      cmd = "Mason",
      keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
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
  opts = {
    -- enable inlay hints
    inlay_hints = {
      enabled = true,
    },
  },
  config = function()
    local on_attach = require("plugins.lsp.utils") -- keymaps

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local lspconfig = require("lspconfig")

    require("mason-lspconfig").setup()

    local servers = require("plugins.lsp.servers")
    for _, server in pairs(servers) do
      server.setup(lspconfig, capabilities, on_attach)
    end
  end,
}
