vim.pack.add({
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

vim.api.nvim_create_autocmd("BufReadPre", {
  group = vim.api.nvim_create_augroup("SetupLualine", { clear = true }),
  once = true,
  callback = function()
    require("lualine").setup({
      sections = {
        lualine_c = { "filename" },
        lualine_x = { "lsp_status", "encoding", "fileformat", "filetype" },
      },
      -- not compatible with nvim-dap-ui control icons
      -- the dap-repl's control icons will disappear if winbar is set
      -- winbar = {
      --   lualine_c = {}
      -- },
      extensions = { "nvim-tree" },
    })
  end,
})
