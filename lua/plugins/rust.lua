vim.pack.add({
  { src = "https://github.com/mrcjkb/rustaceanvim", version = vim.version.range("^9") },
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("SetupRustPlug", { clear = true }),
  pattern = "rust",
  once = true,
  callback = function()
    require("rustaceanvim").setup()
  end,
})
