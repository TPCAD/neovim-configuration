vim.g.mapleader = ";"

local opt = { noremap = true, silent = true }

-- split window
vim.keymap.set("n", "<leader>b", "<C-w>s", opt)
vim.keymap.set("n", "<leader>v", "<C-w>v", opt)

-- switch window
vim.keymap.set("n", "<C-h>", "<C-w>h", opt)
vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
vim.keymap.set("n", "<C-k>", "<C-w>k", opt)
vim.keymap.set("n", "<C-l>", "<C-w>l", opt)

-- exit insert with jk
vim.keymap.set("i", "jk", "<esc>", opt)
-- enter command with space
vim.keymap.set("n", "<space>", ":", opt)

vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

-- delete buffer
vim.keymap.set("n", "<leader>x", ":bd<CR>", opt)

-- Diagnostic keymap
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
