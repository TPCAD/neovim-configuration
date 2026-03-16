local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("mfussenegger/nvim-dap") },
  { src = lz.gh_link("theHamsta/nvim-dap-virtual-text") },
  { src = lz.gh_link("rcarriga/nvim-dap-ui") },
  { src = lz.gh_link("nvim-neotest/nvim-nio") },
  { src = lz.gh_link("jbyuki/one-small-step-for-vimkind") },
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("SetupDebugging", { clear = true }),
  pattern = { "rust", "cpp", "c" },
  once = true,
  callback = function()
    require("config.debugger")
    require("config.dapui")
  end,
})
