return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      {
        mode = { "n", "v" },
        { "<leader><tab>", group = "tabs" },
        { "<leader>f", group = "file/find" },
        { "<leader>g", group = "git" },
        { "<leader>c", group = "code" },
        { "<leader>cw", group = "workspace" },
        { "<leader>m", group = "spider", icon = { icon = "󱇪", color = "blue" } },
        { "<leader>n", group = "increment selection", icon = { icon = "󰒉", color = "yellow" } },
        { "<leader>q", group = "session/quit" },
        { "<leader>s", group = "search" },
        { "<leader>t", group = "terminal" },
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
