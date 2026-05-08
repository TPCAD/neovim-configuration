vim.pack.add({
  { src = "https://github.com/hedyhli/outline.nvim" },
})

vim.keymap.set("n", "<leader>o", function()
  if not package.loaded["lantern"] then
    require("lantern").setup()
  end
  vim.cmd("Outline")
end, { desc = "Open outline" })
