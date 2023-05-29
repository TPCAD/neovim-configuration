local set = vim.o
set.number = true
set.relativenumber = true
set.clipboard = "unnamed"

-- 在 copy 后高亮
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			timeout = 300,
		})
	end,
})

-- keybindings
vim.g.mapleader = ";"
local opt = { noremap = true, silent = true }

vim.keymap.set("n", "<C-h>", "<C-w>h", opt)
vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
vim.keymap.set("n", "<C-k>", "<C-w>k", opt)
vim.keymap.set("n", "<C-l>", "<C-w>l", opt)

vim.keymap.set("i", "jk", "<esc>", opt)
vim.keymap.set("n", "<space>", ":", opt)

vim.keymap.set("n", "<leader>b", "<C-w>s", opt)
vim.keymap.set("n", "<leader>v", "<C-w>v", opt)

vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true})
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true})

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
  { "catppuccin/nvim", name = "catppuccin", lazy = true}})
vim.cmd.colorscheme("catppuccin-frappe")
