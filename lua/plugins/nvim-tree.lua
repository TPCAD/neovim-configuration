local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("nvim-tree/nvim-tree.lua") },
})

lz.by_keys("nvim-tree", "n", "<leader>ee", "NvimTreeToggle", { desc = "File Explorer" }, {
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
