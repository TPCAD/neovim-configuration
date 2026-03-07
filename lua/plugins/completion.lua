return {
  "saghen/blink.cmp",
  event = { "BufReadPost", "BufNewFile" },
  cond = not vim.g.vscode,
  version = "1.*",
  opts = function()
    return require("config.completion")
  end,
}
