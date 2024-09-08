local opt = vim.opt

opt.number = true -- line number
opt.relativenumber = true -- relative line number

opt.mouse = "a" -- enable mouse

opt.clipboard = "unnamed" -- sync with system clipboard

opt.colorcolumn = "80" -- highlight 80th column

-- write swap file to disk if no operations after `updatetime` milliseconds
opt.updatetime = 500

opt.exrc = true -- enable local vim config file

opt.termguicolors = true -- enable terminal color

-- display whitespace character
opt.list = true
vim.opt.listchars:append("space:⋅")

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- native code fold in nvim with nvim-treesitter
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldenable = false
-- opt.foldlevel = 99
