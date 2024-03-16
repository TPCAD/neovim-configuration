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
  -- ui
  -- alpha
  -- require("config.plugins.alpha"),
  -- colorscheme
  require("config.plugins.colorscheme"),
  -- lualine
  require("config.plugins.lualine"),
  -- bufferline
  require("config.plugins.bufferline"),

  -- lsp
  -- LSP
  require("config.plugins.lsp"),
  -- DAP
  -- require("config.plugins.dap"),
  -- cmp
  require("config.plugins.cmp"),
  -- null-ls
  require("config.plugins.null-ls"),
  -- comment
  require("config.plugins.comment"),
  -- treesitter
  require("config.plugins.tree-sitter"),
  -- neodev
  require("config.plugins.neodev"),
  -- markdown preview
  require("config.plugins.markdown-preview"),
  -- rust
  require("config.plugins.rust").rust,
  require("config.plugins.rust").rust_tools,
  -- yuck
  require("config.plugins.yuck").yuck,
  require("config.plugins.yuck").parinfer,

  -- functional
  -- telescope
  require("config.plugins.telescope"),
  -- toggleterm
  require("config.plugins.toggleterm"),
  -- nvim-tree
  require("config.plugins.nvim-tree"),

  -- convenient
  -- auto pairs
  require("config.plugins.autopairs"),
  -- which-key
  require("config.plugins.which-key"),
  -- flash
  require("config.plugins.flash"),
  -- surround
  require("config.plugins.surround"),
  -- better escape
  require("config.plugins.better-escape"),
  -- indent-blankline
  require("config.plugins.indent-blankline"),
  -- cursor word highlight
  require("config.plugins.local-highlight"),

  -- funny
  -- cellular-automaton
  require("config.plugins.cellular-automaton"),
})
