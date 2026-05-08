vim.pack.add({
  { src = "https://github.com/folke/lazydev.nvim" },
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("SetupLazyDev", { clear = true }),
  pattern = "lua",
  once = true,
  callback = function()
    require("lazydev").setup({
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        { path = "snacks.nvim", words = { "Snacks" } },
        { path = "lazy.nvim", words = { "LazyVim" } },
        { path = "blink.cmp", words = { "Blink" } },
      },
    })
  end,
})
