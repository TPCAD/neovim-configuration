-- rust.vim
return {
  {
    "rust-lang/rust.vim",
    ft = "rust",
    cond = not vim.g.vscode,
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  -- rustacean
  {
    "mrcjkb/rustaceanvim",
  cond = not vim.g.vscode,
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
}
