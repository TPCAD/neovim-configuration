return {
  "folke/noice.nvim",
  -- enabled = false,
  event = "VeryLazy",
  -- stylua: ignore start
  keys = {
    { "<leader>sn", "", desc = "+noice" },
    { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message", },
    { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
    { "<leader>snt", function() require("noice").cmd("pick") end, desc = "Noice Picker (Telescope/FzfLua)" },
    { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
    { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
  -- stylua: ignore end
  },
  opts = {
    lsp = {
      signature = {
        enabled = true,
        opts = {
          -- relative = "cursor",
          -- anchor = "NW",
          position = {
            row = 2,
            -- col = 0,
          },
          size = {
            -- width = "auto",
            -- height = "auto",
            max_height = 10,
            max_width = 100,
          },
          win_options = {
            winhighlight = {
              Normal = "Normal",
            },
          },
        }
      },
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        -- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      lsp_doc_border = true,
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "shell_out",
        },
        opts = {enter = true},
        view = "popup",
      },
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
    },
    views = {
      popup = {
        win_options = {
          winhighlight = {
            Normal = "Normal",
          },
        },
        size = {
          width = "80%",
          height = "auto"
        }
      },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    -- "rcarriga/nvim-notify",
  },
}
