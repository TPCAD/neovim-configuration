return {
  "chrisgrieser/nvim-spider",
  keys = {
    {
      "<leader>me",
      "<cmd>lua require('spider').motion('e')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider e",
    },
    {
      "<leader>mw",
      "<cmd>lua require('spider').motion('w')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider w",
    },
    {
      "<leader>mb",
      "<cmd>lua require('spider').motion('b')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider b",
    },
    -- ...
  },
}
