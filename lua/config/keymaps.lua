vim.g.mapleader = ";"

-- vim.keymap.set({mode}, {lhs}, {rhs}, {opts})
-- {opts} noremap: disable recursive mapping, desc: description of keymap

local opts = { noremap = true, silent = true }

-- split window
vim.keymap.set("n", "<leader>b", "<C-w>s", opts)
vim.keymap.set("n", "<leader>v", "<C-w>v", opts)

-- switch window
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- exit insert with jk
vim.keymap.set("i", "jk", "<esc>", opts)
-- enter command with space
vim.keymap.set("n", "<space>", ":", opts)

-- move cursor up and down more intelligent
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

-- delete buffer
vim.keymap.set("n", "<leader>x", ":bd<CR>", opts)

-- termial mode prefix key
vim.keymap.set("t", "<leader>jk", "<C-\\><C-n>", opts)
