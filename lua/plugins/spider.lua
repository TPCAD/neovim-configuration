return {
  "chrisgrieser/nvim-spider",
  keys = {
    {
      "<leader>u",
      "<cmd>lua require('spider').motion('e')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider e",
    },
    {
      "<leader>m",
      "<cmd>lua require('spider').motion('w')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider w",
    },
    {
      "<leader>i",
      "<cmd>lua require('spider').motion('b')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider b",
    },
    -- ...
  },
}
