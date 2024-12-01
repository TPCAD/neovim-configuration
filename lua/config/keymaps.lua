vim.g.mapleader = ";"

-- vim.keymap.set({mode}, {lhs}, {rhs}, {opts})
-- {opts} noremap: disable recursive mapping, desc: description of keymap

-- local opts = { silent = true }
local function opts(description)
  return {
    silent = true,
    desc = description,
  }
end

-- split window
vim.keymap.set("n", "<leader>sh", "<C-w>s", opts("Split window horizontally"))
vim.keymap.set("n", "<leader>sv", "<C-w>v", opts("Split window vertically"))

-- switch window
vim.keymap.set("n", "<C-h>", "<C-w>h", opts("Switch to right window"))
vim.keymap.set("n", "<C-j>", "<C-w>j", opts("Switch to bottom window"))
vim.keymap.set("n", "<C-k>", "<C-w>k", opts("Switch to up window"))
vim.keymap.set("n", "<C-l>", "<C-w>l", opts("Switch to left window"))

-- resize window
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts("Decrease current window vertically"))
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts("Increase current window vertically"))
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts("Increase current window horizontally"))
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts("Decrease current window horizontally"))

-- exit insert with jk
vim.keymap.set("i", "jk", "<esc>", opts("Exit insert mode"))
-- enter command with space
vim.keymap.set("n", "<space>", ":", opts("Enter command mode"))

-- move cursor up and down more intelligent
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { expr = true, desc = "move cursor down" })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { expr = true, desc = "move cursor up" })

-- delete buffer
vim.keymap.set("n", "<leader>x", ":bd<CR>", opts("Delete current buffer"))

-- termial mode prefix key
vim.keymap.set("t", "<leader>jk", "<C-\\><C-n>", opts("Termial mode prefix key"))
