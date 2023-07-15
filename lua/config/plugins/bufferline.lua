return {
	"akinsho/bufferline.nvim",
	version = "*",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<C-l>", ":bnext<CR>", desc = "switch to next buffer" },
		{ "<C-h>", ":bprevious<CR>", desc = "switch to previous buffer" },
	},
	config = function()
		require("bufferline").setup({})
	end,
}
