local M = {
  asm = {
    setup = function(lspconfig, capabilities, on_attach)
      lspconfig.asm_lsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },

  c = {
    setup = function(lspconfig, capabilities, on_attach)
      lspconfig.clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },

  lua = {
    setup = function(lspconfig, capabilities, on_attach)
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      })
    end,
  },
}

return M
