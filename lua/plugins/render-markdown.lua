return {
  -- {
  --   "OXY2DEV/markview.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     markdown = {
  --       code_blocks = { enable = true },
  --     },
  --   },
  -- },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    keys = {
      {
        "<leader>cp",
        mode = "n",
        function()
          require("render-markdown").buf_toggle()
        end,
      },
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      heading = {
        icons = {
          "󰼏  ",
          "󰎨  ",
          "󰼑  ",
          "󰎲  ",
          "󰼓 ",
          "󰎴 ",
        },
      },
    },
  },
}
