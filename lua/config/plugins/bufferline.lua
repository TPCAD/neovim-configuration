return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "BufRead",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<Tab>", ":bnext<CR>", desc = "switch to next buffer" },
    { "<S-Tab>", ":bprevious<CR>", desc = "switch to previous buffer" },
  },
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
        custom_areas = {
          right = function()
            local result = {}
            local seve = vim.diagnostic.severity
            local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
            local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
            local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

            if error ~= 0 then
              table.insert(result, { text = "  " .. error })
            end

            if warning ~= 0 then
              table.insert(result, { text = "  " .. warning })
            end

            if hint ~= 0 then
              table.insert(result, { text = "  " .. hint })
            end

            return result
          end,
        },
      },
    })
  end,
}
