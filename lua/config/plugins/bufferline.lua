return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "BufRead",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<Tab>", ":bnext<CR>", desc = "switch to next buffer" },
		{ "<S-Tab>", ":bprevious<CR>", desc = "switch to previous buffer" },
	},
	config = function()
		require("bufferline").setup({})
	end,
}
