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

  cmake = {
    setup = function(lspconfig, capabilities, on_attach)
      lspconfig.cmake.setup({
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

  python = {
    setup = function(lspconfig, capabilities, on_attach)
      lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.jedi_language_server.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },

  rust = {
    setup = function(lspconfig, capabilities, on_attach)
      lspconfig.rust_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },
}

return M
