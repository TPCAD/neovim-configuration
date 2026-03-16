local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("chrisgrieser/nvim-spider") },
})

lz.by_keys("spider", { "n", "o", "x" }, "<leader>me", "lua require('spider').motion('e')", { desc = "Spider e" })
lz.by_keys("spider", { "n", "o", "x" }, "<leader>mw", "lua require('spider').motion('w')", { desc = "Spider w" })
lz.by_keys("spider", { "n", "o", "x" }, "<leader>mb", "lua require('spider').motion('b')", { desc = "Spider b" })
