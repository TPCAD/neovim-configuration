return {
  "nvim-lualine/lualine.nvim",
  event = "BufRead",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local opts = {
      sections = {
        lualine_c = { "filename" },
      },
      extensions = { "nvim-tree", "trouble" },
    }

    -- add trouble symbols to lualine
    local trouble = require("trouble")
    local symbols = trouble.statusline({
      mode = "symbols",
      groups = {},
      title = false,
      filter = { range = true },
      format = "{kind_icon}{symbol.name:Normal}",
      -- The following line is needed to fix the background color
      -- Set it to the lualine section you want to use
      hl_group = "lualine_c_normal",
    })
    table.insert(opts.sections.lualine_c, {
      symbols.get,
      cond = symbols.has,
    })

    return opts
  end,
}
