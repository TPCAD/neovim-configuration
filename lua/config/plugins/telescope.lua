return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  cmd = "Telescope",
  lazy = true,
  keys = {
    { "<leader>ff", ":Telescope find_files<CR>", desc = "find_files" },
    { "<leader>fg", ":Telescope live_grep<CR>", desc = "live_grep" },
    { "<leader>fb", ":Telescope buffers<CR>", desc = "buffers" },
    { "<leader>fo", ":Telescope oldfiles<CR>", desc = "old_files" },
    { "<leader>fa", ":Telescope diagnostics<CR>", desc = "diagnostics" },
    { "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>", desc = "current_buffer_fuzzy_find" },
    -- { "<leader>", ":Telescope git_branches<CR>", desc = "git_branches" },
    -- { "<leader>", ":Telescope git_bcommits<CR>", desc = "git_commits" },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })
    require("telescope").load_extension("fzf")
  end,
}
