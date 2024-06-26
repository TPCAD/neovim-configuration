-- Lua
return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
  },
  keys = {
    {
      "<leader>sc",
      mode = { "n" },
      function()
        require("persistence").load()
      end,
      desc = "Load current session",
    },
    {
      "<leader>sl",
      mode = { "n" },
      function()
        require("persistence").load({ last = true })
      end,
      desc = "Load last session",
    },
    {
      "<leader>sd",
      mode = { "n" },
      function()
        require("persistence").stop()
      end,
      desc = "Stop persistence",
    },
  },
}
