return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "ToggleTerm" },
  keys = {
    { "<leader>t", ":ToggleTerm<CR>", desc = "Float Terminal" },
  },
  opts = {
    open_mapping = [[<leader>t]],
    direction = "float",
  },
}
