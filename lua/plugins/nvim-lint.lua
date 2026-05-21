vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-lint" },
})

require("lint").linters_by_ft = {
  sh = { "shellcheck" },
  python = { "ruff" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("TryLint", { clear = true }),
  once = true,
  callback = function()
    require("lint").try_lint()
  end,
})
