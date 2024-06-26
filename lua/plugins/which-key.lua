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
    wk.register({
      ["<leader>w"] = { name = "Which Key" },
      ["<leader>b"] = { name = "Split Window Below" },
      ["<leader>v"] = { name = "Split Window Right" },
      ["<leader>x"] = { name = "Delete Current Buffer" },
      ["<leader>f"] = { name = "file/find" },
    })
  end,
}
