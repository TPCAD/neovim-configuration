return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    require("dapui").setup()
    require("nvim-dap-virtual-text").setup()
  end,
}
