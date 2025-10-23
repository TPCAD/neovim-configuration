return {
  "saghen/blink.cmp",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "rafamadriz/friendly-snippets" },

  version = "1.*",

  opts = {
    keymap = {
      preset = "default",
      ["<C-o>"] = { "show", "hide", "fallback" },
      ["<C-y>"] = { "show_documentation", "hide_documentation", "fallback" },
      ["<enter>"] = { "select_and_accept", "fallback" },
      ["<C-n>"] = { "select_next", "snippet_forward", "fallback_to_mappings" },
      ["<C-p>"] = { "select_prev", "snippet_backward", "fallback_to_mappings" },
    },
    completion = {
      menu = {
        border = "rounded",
        winhighlight = "Normal:CmpItemMenu",
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind", "source_name", gap = 1 },
          },
        },
        cmdline_position = function()
          if vim.g.ui_cmdline_pos ~= nil then
            local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
            return { pos[1], pos[2] }
          end
          local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
          return { vim.o.lines - height, 0 }
        end,
      },

      list = {
        selection = { preselect = false, auto_insert = false },
      },
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
          winhighlight = "Normal:CmpItemMenu,BlinkCmpDocSeparator:CmpItemMenu",
        },
      },
    },
    cmdline = {
      enabled = true,
      keymap = {
        preset = "inherit",
        ["<C-n>"] = { "show_and_insert", "select_next", "snippet_forward", "fallback_to_mappings" },
        ["<CR>"] = { "accept_and_enter", "fallback" },
      },
      -- completion = {
      --   menu = { auto_show = true },
      --   list = {
      --     selection = {
      --       preselect = false,
      --       auto_insert = true,
      --     },
      --   },
      -- },
    },
    sources = {
      providers = {
        cmdline = {
          min_keyword_length = function(ctx)
            -- when typing a command, only show when the keyword is 3 characters or longer
            if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
              return 3
            end
            return 0
          end,
        },
      },
    },
  },
}
