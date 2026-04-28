local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("stevearc/oil.nvim") },
})

require("oil").setup()

vim.keymap.set("n", "<leader>eo", "<cmd>Oil<CR>", { desc = "Open Oil" })
