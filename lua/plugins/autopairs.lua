return {
  "windwp/nvim-autopairs",
  event = "VeryLazy",
  cond = not vim.g.vscode,
  config = function()
    require("nvim-autopairs").setup({})
  end,
}
