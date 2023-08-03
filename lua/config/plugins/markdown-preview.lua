return {
	"iamcco/markdown-preview.nvim",
	config = function()
		vim.fn["mkdp#util#install"]()
		vim.g.mkdp_auto_close = 0
		vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
		vim.g.mkdp_refresh_slow = 1
		vim.cmd([[
      function OpenMarkdownPreview (url)
        execute "silent ! google-chrome-stable --new-window --app=" . a:url
      endfunction
    ]])
	end,
}
