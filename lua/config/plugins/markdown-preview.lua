return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  ft = "markdown",
  -- cmd = { "MarkdownPreview", "MarkdownPreviewToggle" },
  keys = {
    { "<leader>mp", ":MarkdownPreviewToggle<CR>", desc = "Markdown Preview Toggle" },
  },
  config = function()
    vim.g.mkdp_auto_close = 0
    -- vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
    vim.g.mkdp_refresh_slow = 0
    vim.cmd([[
      function OpenMarkdownPreview (url)
        execute "silent ! google-chrome-stable --new-window --app=" . a:url
      endfunction
    ]])
  end,
}
