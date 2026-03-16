local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("nvim-treesitter/nvim-treesitter") },
})

lz.by_events("nvim-treesitter", "BufRead", "SetupTreesitter", {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "lua",
    "query",
    "rust",
    "vim",
    "vimdoc",
  },
  auto_install = false,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>in", -- set to `false` to disable one of the mappings
      node_incremental = "<leader>in",
      node_decremental = "<leader>id",
      scope_incremental = "<leader>is",
    },
  },
})
