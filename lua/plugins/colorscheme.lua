return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme("catppuccin-frappe")
    end,
  },
  {
    "shaunsingh/nord.nvim",
    event = "User LazyColorscheme",
  },
  {
    "loctvl842/monokai-pro.nvim",
    event = "User LazyColorscheme",
  },
}
