vim.pack.add({
  { src = "https://github.com/williamboman/mason.nvim" },
})

require("mason").setup()

vim.keymap.set("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Mason" })
