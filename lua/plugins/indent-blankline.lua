vim.pack.add({
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("SetupIndentBlankline", { clear = true }),
  once = true,
  callback = function()
    require("ibl").setup()
  end,
})
