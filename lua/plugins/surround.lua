local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("kylechui/nvim-surround"), version = vim.version.range("^4.0.0") },
})

lz.by_events("nvim-surround", "BufReadPost", "SetupSurround")
