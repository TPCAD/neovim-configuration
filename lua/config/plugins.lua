-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- colorscheme
  require("config.plugins.colorscheme"),
  -- alpha
  require("config.plugins.alpha"),
  -- cellular-automaton
  require("config.plugins.cellular-automaton"),
  -- telescope
  require("config.plugins.telescope"),
  -- lualine
  require("config.plugins.lualine"),
  -- bufferline
  require("config.plugins.bufferline"),
  -- nvim-tree
  require("config.plugins.nvim-tree"),
  -- neodev
  require("config.plugins.neodev"),
  -- comment
  require("config.plugins.comment"),
  -- auto pairs
  require("config.plugins.autopairs"),
  -- LSP
  require("config.plugins.lsp"),
  -- DAP
  -- require("config.plugins.dap"),
  -- cmp
  require("config.plugins.cmp"),
  -- null-ls
  require("config.plugins.null-ls"),
  -- treesitter
  require("config.plugins.tree-sitter"),
  -- rust
  require("config.plugins.rust").rust,
  require("config.plugins.rust").rust_tools,
  -- toggleterm
  require("config.plugins.toggleterm"),
  -- which-key
  require("config.plugins.which-key"),
  -- flash
  require("config.plugins.flash"),
  -- better escape
  require("config.plugins.better-escape"),
  -- indent-blankline
  require("config.plugins.indent-blankline"),
  -- yuck
  require("config.plugins.yuck").yuck,
  require("config.plugins.yuck").parinfer,
  -- markdown preview
  require("config.plugins.markdown-preview"),
  -- cursor word highlight
  require("config.plugins.local-highlight"),
  -- surround
  require("config.plugins.surround"),
})
