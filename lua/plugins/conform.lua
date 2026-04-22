local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("stevearc/conform.nvim") },
})

-- keymaps to toggle autoformatting
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

-- user command to disable autoformatting
vim.api.nvim_create_user_command("ConformDisable", function(args)
  if args.bang then
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

-- user command to enable autoformatting
vim.api.nvim_create_user_command("ConformEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

-- keymap to format selection
vim.keymap.set(
  { "n", "x" },
  "<leader>cf",
  ':lua require("conform").format({ async = true, lsp_fallback = true })<cr>',
  { desc = "Format Buffer/Selection" }
)

lz.by_events("conform", { "BufWrite", "InsertEnter" }, "SetupConform", {
  notify_on_error = true,
  formatters_by_ft = {
    c = { "clang_format" },
    lua = { "stylua" },
    sh = { "shfmt" },
    json = { "clang_format" },
    toml = { "taplo" },
    python = { "black" },
  },
  format_after_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 5000, lsp_format = "fallback" }
  end,
})
