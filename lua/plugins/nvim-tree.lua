vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
})

vim.keymap.set("n", "<leader>ee", function()
  if not package.loaded["nvim-tree"] then
    require("nvim-tree").setup({
      hijack_unnamed_buffer_when_opening = true,
      disable_netrw = true,
      hijack_cursor = true,
      diagnostics = {
        enable = true,
      },
      update_focused_file = {
        enable = true,
      },
    })
  end

  vim.cmd("NvimTreeToggle")
end, { desc = "File Explorer" })
