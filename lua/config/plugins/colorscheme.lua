return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    vim.cmd.colorscheme("catppuccin-frappe")
    -- vim.cmd.colorscheme("catppuccin-latte")
    -- vim.cmd.colorscheme("catppuccin-macchiato")
    -- vim.cmd.colorscheme("catppuccin-mocha")
  end,
}

-- return {
-- 	"loctvl842/monokai-pro.nvim",
-- 	priority = 1000,
-- 	lazy = false,
-- 	config = function()
-- 		require("monokai-pro").setup()
-- 		vim.cmd.colorscheme("monokai-pro")
-- 	end,
-- }
