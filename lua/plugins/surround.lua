vim.pack.add({
  { src = "https://github.com/kylechui/nvim-surround", version = vim.version.range("^4.0.0") },
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("SetupSurround", { clear = true }),
  once = true,
  callback = function()
    require("nvim-surround").setup()
  end,
})
