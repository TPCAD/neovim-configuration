return {
  "williamboman/mason.nvim",
  event = { "BufReadPost", "BufWritePost", "BufNewFile", "VimEnter" },
  cond = not vim.g.vscode,
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents event = "VeryLazy",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  opts = {},
}
