return {
  "nvim-tree/nvim-tree.lua",
  lazy = true,
  cmd = { "NvimTreeOpen", "NvimTreeToggle" },
  keys = {
    { "<leader>e", ":NvimTreeToggle<CR>", "n", desc = "open file tree" },
  },
  config = function()
    require("nvim-tree").setup({
      filters = {
        dotfiles = false,
        exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
      },
      disable_netrw = true,
      hijack_netrw = true,
      -- hijack_cursor = true,
      git = {
        ignore = false,
      },
      renderer = {
        icons = {
          glyphs = {
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    })
  end,
}
