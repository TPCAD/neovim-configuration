return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cmd = { "ToggleTerm" },
	keys = {
		{ "<leader>t", ":ToggleTerm<CR>", desc = "Open a float terminal" },
	},
	opts = {
		open_mapping = [[<leader>t]],
		direction = "float",
	},
}
