return {
  "williamboman/mason.nvim",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents event = "VeryLazy",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  opts = {},
}
