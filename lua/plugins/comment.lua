local lz = require("utils").lazyload

vim.pack.add({
  {
    src = lz.gh_link("numToStr/Comment.nvim"),
  },
})

lz.by_events("Comment", { "BufReadPost", "BufWritePost", "BufNewFile" }, "SetupComment")
