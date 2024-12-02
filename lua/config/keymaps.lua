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
vim.keymap.set("n", "<leader>sh", "<C-w>s", opts("Split Window Horizontally"))
vim.keymap.set("n", "<leader>sv", "<C-w>v", opts("Split Window Vertically"))

-- switch window
vim.keymap.set("n", "<C-h>", "<C-w>h", opts("Switch to Right Window"))
vim.keymap.set("n", "<C-j>", "<C-w>j", opts("Switch to Lower Window"))
vim.keymap.set("n", "<C-k>", "<C-w>k", opts("Switch to Upper Window"))
vim.keymap.set("n", "<C-l>", "<C-w>l", opts("Switch to Left Window"))

-- resize window
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts("Decrease Window Width"))
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts("Increase Window Width"))
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts("Increase Window Height"))
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts("Decrease Window Height"))

-- exit insert with jk
vim.keymap.set("i", "jk", "<esc>", opts("Exit Insert Mode"))
-- enter command with space
vim.keymap.set("n", "<space>", ":", opts("Enter Command Mode"))

-- move cursor up and down more intelligent
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { expr = true, desc = "Move Cursor Down" })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { expr = true, desc = "Move Cursor Up" })

-- delete buffer
vim.keymap.set("n", "<leader>x", ":bd<CR>", opts("Delete current buffer"))

-- terminal
vim.keymap.set("n", "<C-/>", function()
  Snacks.terminal(nil, { env = { is_bottom = "yes" } })
end, opts("Terminal"))
vim.keymap.set("n", "<C-_>", function()
  Snacks.terminal(nil, { env = { is_bottom = "yes" } })
end, opts("Terminal"))
vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", opts("Hide Terminal"))
vim.keymap.set("t", "<C-_>", "<cmd>close<cr>", opts("Hide Terminal"))

vim.keymap.set("n", "<leader>tf", function()
  Snacks.terminal(nil, { env = { is_float = "yes" }, win = { position = "float" } })
end, opts("Floating Terminal"))

-- termial mode prefix key
vim.keymap.set("t", "jk", "<C-\\><C-n>", opts("Termial Mode Prefix Key"))
