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
          indent_blankline = {
            enabled = true,
            scope_color = "lavender",
            colored_indent_levels = true,
          },
          lsp_trouble = true,
          mason = true,
          noice = true,
          nvim_surround = true,
          nvimtree = true,
          snacks = true,
          treesitter = true,
          which_key = true,
        },
        highlight_overrides = {
          frappe = function(frappe)
            return {
              CursorLineNr = { fg = frappe.yellow },
              TelescopeSelection = { bg = frappe.surface0 },
              TelescopeSelectionCaret = { fg = frappe.yellow, bg = frappe.surface0 },
              TelescopePromptPrefix = { fg = frappe.yellow },
              FlashCurrent = { bg = frappe.peach, fg = frappe.base },
              FlashMatch = { bg = frappe.red, fg = frappe.base },
              FlashLabel = { bg = frappe.teal, fg = frappe.base },
              NormalFloat = { bg = frappe.base },
              FloatBorder = { bg = frappe.base },
              FloatTitle = { bg = frappe.base },
              BlinkCmpMenu = { bg = frappe.base },
              BlinkCmpMenuBorder = { bg = frappe.base },
            }
          end,
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
