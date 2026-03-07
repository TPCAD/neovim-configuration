return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPost",
  cond = not vim.g.vscode,
  opts = {},
}
