return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        integrations = {
          cmp = true,
          flash = true,
          gitsigns = true,
          grug_far = true,
          lsp_trouble = true,
          mason = true,
          noice = true,
          nvim_surround = true,
          nvimtree = true,
          snacks = true,
          treesitter = true,
          which_key = true,
        },
      })
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
