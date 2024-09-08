-- riggrep required
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", ":Telescope find_files<CR>", desc = "Find Files" },
    { "<leader>fg", ":Telescope live_grep<CR>", desc = "Live Grep" },
    { "<leader>fb", ":Telescope buffers<CR>", desc = "Buffers" },
    { "<leader>fo", ":Telescope oldfiles<CR>", desc = "Old Files" },
    { "<leader>fa", ":Telescope diagnostics<CR>", desc = "Diagnostics" },
    { "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>", desc = "Fuzzy Find in Current Buffer" },
    -- { "<leader>", ":Telescope git_branches<CR>", desc = "git_branches" },
    -- { "<leader>", ":Telescope git_bcommits<CR>", desc = "git_commits" },
  },
  config = function()
    local open_with_trouble = require("trouble.sources.telescope").open

    -- Use this to add more results without clearing the trouble list
    -- local add_to_trouble = require("trouble.sources.telescope").add

    require("telescope").setup({
      defaults = {
        mappings = {
          i = { ["<c-t>"] = open_with_trouble },
          n = { ["<c-t>"] = open_with_trouble },
        },
      },
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
