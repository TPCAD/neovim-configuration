local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("lukas-reineke/indent-blankline.nvim") },
})

lz.by_events("ibl", "BufReadPost", "SetupIndentBlankline")
