return {
  {
    "folke/snacks.nvim",
    cond = not vim.g.vscode,
    priority = 1000,
    lazy = false,
    opts = function()
      return require("config.snacks")
    end,
  },
}
