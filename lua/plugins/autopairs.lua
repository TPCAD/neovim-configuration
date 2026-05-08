vim.pack.add({
  { src = "https://github.com/windwp/nvim-autopairs" },
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = vim.api.nvim_create_augroup("SetupAutopairs", { clear = true }),
  once = true,
  callback = function()
    require("nvim-autopairs").setup()
  end,
})
