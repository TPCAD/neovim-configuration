local set = vim.o
set.number = true
set.relativenumber = true
set.clipboard = "unnamed"
set.mouse = "a"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 在 copy 后高亮
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			timeout = 300,
		})
	end,
})

-- ignore case when type ":" to enter command mode
local cmdline_smartcase = vim.api.nvim_create_augroup("cmdline_smartcase", { clear = true })

vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
	pattern = ":",
	group = cmdline_smartcase,
	command = "set ignorecase",
})

vim.api.nvim_create_autocmd({ "CmdlineLeave" }, {
	pattern = ":",
	group = cmdline_smartcase,
	command = "set noignorecase",
})
