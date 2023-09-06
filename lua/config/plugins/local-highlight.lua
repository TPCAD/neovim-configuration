return {
	"tzachar/local-highlight.nvim",
	-- event = "BufRead",
	config = function()
		require("local-highlight").setup({
			disable_file_types = { "markdown" },
			hlgroup = "LocalHighlight",
			cw_hlgroup = nil,
		})
	end,
}
