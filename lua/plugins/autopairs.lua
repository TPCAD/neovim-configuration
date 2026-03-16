local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("windwp/nvim-autopairs") },
})

lz.by_events("nvim-autopairs", "InsertEnter", "SetupAutopairs")
