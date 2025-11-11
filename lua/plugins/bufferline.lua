return {
  "akinsho/bufferline.nvim",
  enabled = false,
  version = "*",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    -- custom pinned icon
    local groups = require("bufferline.groups")
    groups.builtin.pinned.icon = ""

    return {
      options = {
        separator_style = "slope", -- slant, slope, thick, thin, { ">", "<" }
        always_show_bufferline = false,
        auto_toggle_bufferline = false,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, level, _, context)
          if context.buffer:current() then
            return ""
          end
          local icon = level:match("error") and "" or ""
          return "" .. icon
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
      },
    }
  end,
}
