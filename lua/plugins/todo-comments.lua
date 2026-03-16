-- return {
--   "folke/todo-comments.nvim",
--   dependencies = { "nvim-lua/plenary.nvim" },
--   event = "VeryLazy",
--   cond = not vim.g.vscode,
--   opts = {},
--   keys = {
--     -- stylua: ignore start
--     { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment", },
--     { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment", },
--     -- stylua: ignore end
--     { "<leader>xt", "<cmd>Trouble todo<CR>", desc = "Todo (Trouble)" },
--     {
--       "<leader>xT",
--       "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
--       desc = "Todo/Fix/Fixme (Trouble)",
--     },
--   },
-- }
local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("folke/todo-comments.nvim") },
})

lz.by_events("todo-comments", "BufEnter", "SetupTodoComments")

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next Todo Comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous Todo Comment" })
