return {
  "stevearc/conform.nvim",
  dependencies = { "williamboman/mason.nvim" },
  -- the mappings would be set no matter conform.nvim is loaded
  init = function()
    vim.g.disable_autoformat = false
    vim.keymap.set("n", "<leader>tf", function()
      if vim.g.disable_autoformat then
        vim.g.disable_autoformat = false
        vim.notify("Autoformat is enabled", vim.log.levels.INFO)
      else
        vim.g.disable_autoformat = true
        vim.notify("Autoformat is disabled", vim.log.levels.WARN)
      end
    end, { desc = "Toggle autoformatting" })
  end,
  event = { "BufWritePre", "InsertEnter" },
  cmd = { "ConformInfo", "ConformEnable", "ConformDisable" },
  keys = {
    {
      "<leader>cf",
      mode = { "n", "x" },
      ':lua require("conform").format({ async = true, lsp_fallback = true })<cr>',
      desc = "Format Buffer/Selection",
    },
  },
  opts = function()
    return require("config.conform")
  end,
}
