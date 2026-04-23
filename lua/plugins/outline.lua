local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("hedyhli/outline.nvim") },
})

lz.by_keys("outline", "n", "<leader>o", "Outline", { desc = "Open outline" })
