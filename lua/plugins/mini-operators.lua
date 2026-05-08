vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.operators" },
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("SetupMiniOperators", { clear = true }),
  once = true,
  callback = function()
    require("mini.operators").setup({
      replace = {
        prefix = "",
      },
    })
  end,
})
