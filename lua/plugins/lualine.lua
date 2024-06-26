return {
  "nvim-lualine/lualine.nvim",
  -- lazy = false,
  event = "BufRead",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({})
  end,
}
