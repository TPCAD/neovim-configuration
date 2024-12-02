return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "BufRead",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        separator_style = "slope", -- slant, slope, thick, thin, { ">", "<" }
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
    })
  end,
}
