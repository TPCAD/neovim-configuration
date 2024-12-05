return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufRead",
  build = ":TSUpdate",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  main = "nvim-treesitter.configs",
  opts = {
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
        init_selection = "<leader>nn", -- set to `false` to disable one of the mappings
        node_incremental = "<leader>nn",
        scope_incremental = "<leader>ns",
        node_decremental = "<leader>nm",
      },
    },
  },
}
