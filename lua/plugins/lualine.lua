return {
  "nvim-lualine/lualine.nvim",
  event = "BufRead",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    extensions = { "nvim-tree", "trouble" },
  },
}
