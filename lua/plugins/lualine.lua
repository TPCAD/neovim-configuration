return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  cond = not vim.g.vscode,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    return require("config.lualine")
  end,
}
