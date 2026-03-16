local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("folke/lazydev.nvim") },
})

lz.by_filetypes("lazydev", "SetupLazyDev", "lua", {
  library = {
    -- See the configuration section for more details
    -- Load luvit types when the `vim.uv` word is found
    { path = "luvit-meta/library", words = { "vim%.uv" } },
    { path = "snacks.nvim", words = { "Snacks" } },
    { path = "lazy.nvim", words = { "LazyVim" } },
    { path = "blink.cmp", words = { "Blink" } },
  },
})
