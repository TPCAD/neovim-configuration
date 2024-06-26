return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeOpen", "NvimTreeToggle" },
  keys = {
    { "<leader>e", ":NvimTreeToggle<CR>", "n", desc = "File Explorer" },
  },
  config = function()
    require("nvim-tree").setup({
      hijack_unnamed_buffer_when_opening = true,
      disable_netrw = true,
      hijack_cursor = true,
      diagnostics = {
        enable = true,
      },
    })
  end,
}
