local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("williamboman/mason.nvim") },
})

lz.by_events("mason", { "BufReadPost", "BufWritePost", "BufNewFile", "VimEnter" }, "SetupMason")

vim.keymap.set("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Mason" })
