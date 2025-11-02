return {
  completion = {
    menu = {
      draw = {
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind", "source_name", gap = 1 },
        },
      },
      -- cmdline_position = function()
      --   if vim.g.ui_cmdline_pos ~= nil then
      --     local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
      --     return { pos[1], pos[2] }
      --   end
      --   local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
      --   return { vim.o.lines - height, 0 }
      -- end,
    },
    documentation = {
      auto_show = true,
    },
  },
  keymap = {
    ["<C-u>"] = { "scroll_documentation_up", "fallback" },
    ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    ["<C-o>"] = { "show", "hide", "fallback" },
    ["<C-y>"] = { "show_documentation", "hide_documentation", "fallback" },
    ["<enter>"] = { "select_and_accept", "fallback" },
    ["<C-n>"] = { "select_next", "snippet_forward", "fallback_to_mappings" },
    ["<C-p>"] = { "select_prev", "snippet_backward", "fallback_to_mappings" },
  },
  signature = {
    enabled = true,
  },
  cmdline = {
    keymap = {
      ["<C-n>"] = { "show_and_insert", "select_next", "snippet_forward", "fallback_to_mappings" },
      ["<CR>"] = { "accept_and_enter", "fallback" },
    },
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
}
