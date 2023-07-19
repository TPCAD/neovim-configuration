return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cmd = { "ToggleTerm" },
	keys = {
		-- { "<leader>th", ":ToggleTerm direction=horizontal<CR>", desc = "Open a horizontal term" },
		{ "<leader>t", ":ToggleTerm<CR>", desc = "Open a float term" },
	},
	opts = {
		open_mapping = [[<leader>t]],
		direction = "float",
	},
}
