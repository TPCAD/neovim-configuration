return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      {
        "jbyuki/one-small-step-for-vimkind",
        ft = "lua",
        config = function()
          vim.keymap.set("n", "<leader>dl", function()
            require("osv").launch({ port = 8086, frozen_delay = 100 })
          end, { noremap = true, desc = "DAP: Launch Nvim Debugger" })
        end,
      },
    },
    lazy = true,
    config = function()
      require("config.debugger")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "theHamsta/nvim-dap-virtual-text", "nvim-neotest/nvim-nio" },
    keys = {
      { "<leader>db", desc = "DAP: Breakpoint" },
      { "<leader>dc", desc = "DAP: Start/Continue" },
      { "<leader>du", desc = "DAP: Toggle UI" },
      "<F1>",
      "<F2>",
      "<F3>",
      "<F4>",
      "<F5>",
      "<F6>",
      "<F7>",
    },
    opts = function()
      return require("config.dapui")
    end,
  },
}
