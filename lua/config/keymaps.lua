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

-- windows
vim.keymap.set("n", "<leader>w", "<C-w>", { silent = true, desc = "Windows", remap = true })

-- switch window
vim.keymap.set("n", "<C-h>", "<C-w>h", opts("Switch to Right Window"))
vim.keymap.set("n", "<C-j>", "<C-w>j", opts("Switch to Lower Window"))
vim.keymap.set("n", "<C-k>", "<C-w>k", opts("Switch to Upper Window"))
vim.keymap.set("n", "<C-l>", "<C-w>l", opts("Switch to Left Window"))

-- resize window
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<cr>", opts("Decrease Window Width"))
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<cr>", opts("Increase Window Width"))
vim.keymap.set("n", "<C-Up>", ":resize +2<cr>", opts("Increase Window Height"))
vim.keymap.set("n", "<C-Down>", ":resize -2<cr>", opts("Decrease Window Height"))

-- exit insert with jk
vim.keymap.set("i", "jk", "<esc>", opts("Exit Insert Mode"))
-- enter command with space
vim.keymap.set("n", "<space>", ":", opts("Enter Command Mode"))

-- move cursor up and down more intelligent
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { expr = true, desc = "Move Cursor Down" })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { expr = true, desc = "Move Cursor Up" })

-- buffer
vim.keymap.set("n", "<tab>", "<cmd>bnext<cr>", opts("Next Buffer"))
vim.keymap.set("n", "<S-tab>", "<cmd>bprevious<cr>", opts("Previous Buffer"))
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", opts("Switch to Other Buffer"))
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", opts("Delete Buffer"))
vim.keymap.set("n", "<leader>bo", function()
  Snacks.bufdelete.other()
end, opts("Delete Other Buffer"))

-- tabs
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", opts("New Tab"))
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", opts("Close Tab"))
vim.keymap.set("n", "<leader><tab>n", "<cmd>tabnext<cr>", opts("Next Tab"))
vim.keymap.set("n", "<leader><tab>p", "<cmd>tabprevious<cr>", opts("Previous Tab"))
vim.keymap.set("n", "<leader><tab>o", "<cmd>tabonly<cr>", opts("Close Other Tab"))
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", opts("First Tab"))
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", opts("Last Tab"))

-- diagnostic
local diagnostic_goto = function(next, severity)
  -- local go = next and vim.diagnostic.jump or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    vim.diagnostic.jump({ count = next, severity = severity, float = true })
  end
end
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts("Line Diagnostics"))
vim.keymap.set("n", "]d", diagnostic_goto(1), opts("Next Diagnostic"))
vim.keymap.set("n", "[d", diagnostic_goto(-1), opts("Prev Diagnostic"))
vim.keymap.set("n", "]e", diagnostic_goto(1, "ERROR"), opts("Next Error"))
vim.keymap.set("n", "[e", diagnostic_goto(-1, "ERROR"), opts("Prev Error"))
vim.keymap.set("n", "]w", diagnostic_goto(1, "WARN"), opts("Next Warning"))
vim.keymap.set("n", "[w", diagnostic_goto(-1, "WARN"), opts("Prev Warning"))
vim.keymap.del("n", "<C-w>d")
vim.keymap.del("n", "<C-w><C-d>")
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
-- vim.keymap.set("t", "jk", "<C-\\><C-n>", opts("Termial Mode Prefix Key"))

-- lazygit
-- TODO: check cwd is git repo
if vim.fn.executable("lazygit") == 1 then
  vim.keymap.set("n", "<leader>gg", function()
    Snacks.lazygit()
  end, opts("Lazygit"))
end

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", opts("Quit All"))

-- noh
vim.keymap.set({ "n", "i" }, "<esc>", "<cmd>noh<cr><esc>", opts("Escape and Clear hlsearch"))
