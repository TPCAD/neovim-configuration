return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufRead",
	build = ":TSUpdate",
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"c",
			"lua",
			"rust",
		},
		auto_install = false,
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
	},
}
