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
  -- telescope
  require("config.plugins.telescope"),
  -- lualine
  require("config.plugins.lualine"),
  -- bufferline
  require("config.plugins.bufferline"),
  -- nvim-tree
  require("config.plugins.nvim-tree"),
  -- LSP
  require("config.plugins.lsp"),
  -- neodev
  require("config.plugins.neodev"),
  -- comment
  require("config.plugins.comment"),
  -- auto pairs
  require("config.plugins.autopairs"),
  -- cmp
  require("config.plugins.cmp"),
  -- null-ls
  require("config.plugins.null-ls"),
  -- rust
  require("config.plugins.rust"),
})
