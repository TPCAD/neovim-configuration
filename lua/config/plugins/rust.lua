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
      local function on_attach(client, buffer) end
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
