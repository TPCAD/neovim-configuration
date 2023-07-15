return {
	"nvim-tree/nvim-tree.lua",
	lazy = true,
	cmd = { "NvimTreeOpen", "NvimTreeToggle" },
	keys = {
		{ "<leader>e", ":NvimTreeToggle<CR>", desc = "open file tree" },
	},
	config = function()
		require("nvim-tree").setup()
	end,
}
