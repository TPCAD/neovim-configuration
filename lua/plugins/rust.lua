vim.pack.add({
  { src = "https://github.com/rust-lang/rust.vim" },
  { src = "https://github.com/linkmrcjkb/rustaceanvim", version = vim.version.range("^6") },
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("SetupRustPlug", { clear = true }),
  pattern = "rust",
  once = true,
  callback = function()
    require("rust").setup()
    vim.g.rustfmt_autosave = 1
    require("rustaceanvim").setup()
  end,
})
