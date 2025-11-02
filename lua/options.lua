vim.loader.enable() -- cache lua module to load neovim fastly

-- global options

vim.opt.mouse = "a" -- enable mouse support in all mode

vim.opt.clipboard = "unnamedplus" -- sync with system clipboard

vim.opt.exrc = true -- enable local vim config file

vim.opt.termguicolors = true -- enable terminal color

vim.opt.winborder = "rounded" -- rounded border for floating window

vim.opt.laststatus = 3 -- only one status

vim.opt.showmode = false -- don't show mode in cmdline

vim.opt.ignorecase = true -- case-insensitive while searching
vim.opt.smartcase = true -- unless one or more capital letters

vim.opt.timeout = false -- decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- write swap file to disk if no operations after `updatetime` milliseconds
-- Also used for 'CursorHold' autocommand event
vim.opt.updatetime = 250

-- display whitespace character
vim.opt.list = true
vim.opt.listchars:append("space:⋅")

-- window-local options

vim.opt.number = true -- line number
vim.opt.relativenumber = true -- relative line number

vim.opt.colorcolumn = "80" -- highlight 80th column

vim.opt.breakindent = true -- indent for wrapped line

-- buffer-local options

-- indent
vim.opt.expandtab = true -- use space when <Tab> is inserted
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- others

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.folding")

-- native code fold in nvim with nvim-treesitter
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldenable = false
-- opt.foldlevel = 99
