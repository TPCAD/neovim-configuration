return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = function()
      vim.cmd.colorscheme("catppuccin-frappe")
    end,
  },
  {
    "shaunsingh/nord.nvim",
    lazy = true,
    event = "User LazyColorscheme",
  },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = true,
    event = "User LazyColorscheme",
  },
}
