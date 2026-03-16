-- -- rust.vim
-- return {
--   {
--     "rust-lang/rust.vim",
--     ft = "rust",
--     cond = not vim.g.vscode,
--     init = function()
--       vim.g.rustfmt_autosave = 1
--     end,
--   },
--
--   -- rustacean
--   {
--     "mrcjkb/rustaceanvim",
--   cond = not vim.g.vscode,
--     version = "^6", -- Recommended
--     lazy = false, -- This plugin is already lazy
--   },
-- }

local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("rust-lang/rust.vim") },
  { src = lz.gh_link("mrcjkb/rustaceanvim"), version = vim.version.range("^6") },
})

lz.by_filetypes("rust", "SetupRust", "rust")
vim.g.rustfmt_autosave = 1
lz.by_filetypes("rustaceanvim", "SetupRustaceanvim", "rust")
