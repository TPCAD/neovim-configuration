local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("nvim-mini/mini.operators") },
})

lz.by_events("mini.operators", "BufReadPost", "SetupMiniOperators", {
  replace = {
    prefix = "",
  },
})
