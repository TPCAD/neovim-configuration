vim.g.mapleader = ";"
vim.g.maplocalleader = "\\"

---@class vim.keymap.set.Opts
---@field nowait? boolean Don't wait key sequences
---@field silent? boolean Don't display command in cmdline
---@field script? boolean
---@field expr? boolean Use the return string as key sequences from rhs
---@field unique? boolean Make the keymap unique. Avoid coverring existed keymap
---@field noremap? boolean Disable recursive mapping
---@field desc? string Description
---@field callback? function Lua function in place of 'rhs'
---@field replace_keycodes? boolean
---@field buffer? integer|boolean Buffer-local mapping
---@field remap? boolean Enable recursive mapping

---@param mode string|string[] Mode "short-name" or a list of thereof
---@param lhs string Left-hand side of mapping
---@param rhs string|function Right-hand side of mapping
---@param opts? vim.keymap.set.Opts Table of map-arguments
-- vim.keymap.set(mode, lhs, rhs, opts)

-- remvoe default keymaps of nvim
-- vim.keymap.del({ "n", "x" }, "gra")
-- vim.keymap.del("n", "grr")
-- vim.keymap.del("n", "gri")
-- vim.keymap.del("n", "grn")
-- vim.keymap.del("n", "gO")
-- vim.keymap.del("i", "<C-s>")

-- windows
-- which-key.nvim will do this
-- vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Windows" })

-- switch window
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch to Right Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Switch to Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Switch to Upper Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch to Left Window" })

-- resize window
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "+", "<c-w>|<c-w>_", { desc = "Maximize Currrent Window" })
vim.keymap.set("n", "=", "<c-w>=", { desc = "Restore Window Layout" })

-- exit insert with jk
vim.keymap.set("i", "jk", "<esc>", { noremap = true, desc = "Exit Insert Mode" })
-- enter command with space
vim.keymap.set("n", "<space>", ":", { desc = "Enter Command Mode" })

-- move cursor up and down more intelligent
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { expr = true, desc = "Move Cursor Down" })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { expr = true, desc = "Move Cursor Up" })
vim.keymap.set("x", "j", [[v:count ? 'j' : 'gj']], { expr = true, desc = "Move Cursor Down" })
vim.keymap.set("x", "k", [[v:count ? 'k' : 'gk']], { expr = true, desc = "Move Cursor Up" })

-- buffer
-- stylua: ignore start
vim.keymap.set("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete Other Buffer" })
vim.keymap.set("n", "<leader>bD", "<cmd>bd<cr>", { desc = "Delete Buffer and Window" })
-- stylua: ignore end

-- tabs
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tab" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })

-- termial mode to normal mode
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Termial Mode Prefix Key" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- noh
vim.keymap.set({ "n", "i" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- run lua code
vim.keymap.set("n", "<leader>rX", "<cmd>source %<cr>", { desc = "Run this lua file" })
vim.keymap.set("n", "<leader>rx", ":.lua<cr>", { desc = "Run this line" })
vim.keymap.set("v", "<leader>rx", ":lua<cr>", { desc = "Run selection" })
