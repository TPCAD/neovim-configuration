vim.pack.add({
  { src = "https://github.com/TPCAD/lantern.nvim" },
})

vim.keymap.set("n", "<leader>ct", function()
  if not package.loaded["lantern"] then
    require("lantern").setup()
  end
  require("lantern").open()
end, { desc = "Toggle lantern dashboard" })
