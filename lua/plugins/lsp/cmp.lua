return {
  "saghen/blink.cmp",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "rafamadriz/friendly-snippets" },

  version = "1.*",

  opts = {
    keymap = {
      preset = "default",
      ["<C-o>"] = { "show", "hide" },
      ["<C-y>"] = { "show_documentation", "hide_documentation" },
      ["<enter>"] = { "select_and_accept", "fallback" },
      ["<C-n>"] = { "select_next", "snippet_forward", "fallback_to_mappings" },
      ["<C-p>"] = { "select_prev", "snippet_backward", "fallback_to_mappings" },
    },
    completion = {
      documentation = {
        auto_show = true,
      },
    },
    signature = {
      enabled = true,
    },
  },
}
