return {
  "L3MON4D3/LuaSnip",
  enabled = false,
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    -- friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    -- my own snippets
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
  end,
}
