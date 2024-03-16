return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      [[  ／|_       ]],
      [[ (o o /      ]],
      [[  |.   ~.    ]],
      [[  じしf_,)ノ ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("LDR e", "  File Explorer", "<leader>e"),
      dashboard.button("LDR ff", "󰈞  Find Files", "<leader>ff"),
      dashboard.button("LDR fo", "󱋢  Find Old Files", "<leader>fo"),
      dashboard.button("LDR fg", "󰈬  Find Word", "<leader>fg"),
    }
    require("alpha").setup(dashboard.opts)
  end,
}
