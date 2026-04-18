local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("mfussenegger/nvim-dap") },
  { src = lz.gh_link("igorlfs/nvim-dap-view") },
  { src = lz.gh_link("jbyuki/one-small-step-for-vimkind") },
  { src = lz.gh_link("mfussenegger/nvim-dap-python") },
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("SetupDebugging", { clear = true }),
  pattern = { "rust", "cpp", "c", "python" },
  once = true,
  callback = function()
    require("config.debugging")
  end,
})
