vim.pack.add({
  { src = "https://github.com/folke/todo-comments.nvim" },
})

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("SetupTodoComments", { clear = true }),
  once = true,
  callback = function()
    require("todo-comments").setup()
  end,
})

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next Todo Comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous Todo Comment" })
