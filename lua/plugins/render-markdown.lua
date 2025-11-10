return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  ft = { "markdown" },
  keys = {
    {
      "<leader>tm",
      mode = "n",
      function()
        require("render-markdown").buf_toggle()
      end,
      desc = "Toggle Buf Markdown Render",
    },
  },
  opts = function()
    return require("config.markdown")
  end,
}
