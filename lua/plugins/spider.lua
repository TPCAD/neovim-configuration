return {
  "chrisgrieser/nvim-spider",
  keys = {
    {
      "e",
      "<cmd>lua require('spider').motion('e')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider e",
    },
    {
      "<leader>me",
      "e",
      mode = { "n", "o", "x" },
      desc = "Normal e",
    },
    {
      "w",
      "<cmd>lua require('spider').motion('w')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider w",
    },
    {
      "<leader>mw",
      "w",
      mode = { "n", "o", "x" },
      desc = "Normal w",
    },
    {
      "b",
      "<cmd>lua require('spider').motion('b')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider b",
    },
    {
      "<leader>mb",
      "b",
      mode = { "n", "o", "x" },
      desc = "Normal b",
    },
  },
}
