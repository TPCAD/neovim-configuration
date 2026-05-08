vim.pack.add({
  { src = "https://github.com/folke/persistence.nvim" },
})

vim.keymap.set("n", "<leader>qs", function()
  require("utils").safe_setup("persistence")

  require("persistence").load()
end, { desc = "Restore Session" })

vim.keymap.set("n", "<leader>qS", function()
  require("utils").safe_setup("persistence")

  require("persistence").select()
end, { desc = "Select Session" })

vim.keymap.set("n", "<leader>ql", function()
  require("utils").safe_setup("persistence")

  require("persistence").load({ last = true })
end, { desc = "Restore Last Session" })

vim.keymap.set("n", "<leader>qd", function()
  require("utils").safe_setup("persistence")

  require("persistence").stop()
end, { desc = "Don't Save Current Session" })
