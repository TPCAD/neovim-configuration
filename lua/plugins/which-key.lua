return {
  "folke/which-key.nvim",
  keys = {
    "<leader>",
    "'",
    '"',
    "`",
    "c",
    "v",
    "g",
    { "<leader>wk", ":WhichKey<CR>", desc = "Which-key All Keymaps" },
  },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {},
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>w", group = "Which Key" },
      { "<leader>b", group = "Split Window Below" },
      { "<leader>v", group = "Split Window Right" },
      { "<leader>x", group = "Delete Current Buffer" },
      { "<leader>f", group = "file/find" },
    })
  end,
}
