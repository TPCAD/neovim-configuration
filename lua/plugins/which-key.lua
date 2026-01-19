return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      {
        mode = { "n", "x" },
        { "<leader><tab>", group = "tabs" },
        { "<leader>e", group = "file explorer", icon = "" },
        { "<leader>f", group = "file/find" },
        { "<leader>g", group = "git" },
        { "<leader>c", group = "code" },
        { "<leader>d", group = "debug" },
        { "<leader>cw", group = "workspace" },
        { "<leader>m", group = "spider", icon = { icon = "󱇪", color = "blue" } },
        { "<leader>i", group = "increment selection", icon = { icon = "󰒉", color = "yellow" } },
        { "<leader>q", group = "session/quit" },
        { "<leader>s", group = "search" },
        { "<leader>t", group = "toggle" },
        { "<leader>l", group = "misc", icon = "" },
        { "<leader>la", icon = "" },
        { "<leader>r", group = "run", icon = "" },
        { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
        -- { "gs", group = "surround" },
        { "z", group = "fold" },
        {
          "<leader>b",
          group = "buffer",
          expand = function()
            return require("which-key.extras").expand.buf()
          end,
        },
        {
          "<leader>w",
          group = "windows",
          proxy = "<c-w>",
          expand = function()
            return require("which-key.extras").expand.win()
          end,
        },
      },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
