vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
})

vim.keymap.set("n", "<leader>eo", function()
  if not package.loaded["oil"] then
    require("oil").setup()
  end
  vim.cmd("Oil")
end, { desc = "Open Oil" })
