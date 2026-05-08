vim.pack.add({
  { src = "https://github.com/chrisgrieser/nvim-spider" },
})

vim.keymap.set({ "n", "o", "x" }, "<leader>me", function()
  require("utils").safe_setup("spider")
  require("spider").motion("e")
end, { desc = "Spider e" })

vim.keymap.set({ "n", "o", "x" }, "<leader>mw", function()
  require("utils").safe_setup("spider")
  require("spider").motion("w")
end, { desc = "Spider w" })

vim.keymap.set({ "n", "o", "x" }, "<leader>mb", function()
  require("utils").safe_setup("spider")
  require("spider").motion("b")
end, { desc = "Spider b" })
