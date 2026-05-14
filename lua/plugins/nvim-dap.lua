vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-dap" },
  { src = "https://github.com/igorlfs/nvim-dap-view" },
  { src = "https://github.com/jbyuki/one-small-step-for-vimkind" },
  { src = "https://github.com/mfussenegger/nvim-dap-python" },
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("SetupDebugging", { clear = true }),
  pattern = { "rust", "cpp", "c", "python" },
  once = true,
  callback = function()
    require("plugins.config.debugging")
  end,
})
