return {
  -- file explorer
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeOpen", "NvimTreeToggle" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", "n", desc = "File Explorer" },
  },
  opts = {
    hijack_unnamed_buffer_when_opening = true,
    disable_netrw = true,
    hijack_cursor = true,
    diagnostics = {
      enable = true,
    },
    update_focused_file = {
      enable = true,
    },
  },
}
