-- return {
--   "MeanderingProgrammer/render-markdown.nvim",
--   dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
--   cond = not vim.g.vscode,
--   ft = { "markdown" },
--   keys = {
--     {
--       "<leader>tm",
--       mode = "n",
--       function()
--         require("render-markdown").buf_toggle()
--       end,
--       desc = "Toggle Buf Markdown Render",
--     },
--   },
--   opts = function()
--     return require("config.markdown")
--   end,
-- }

local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("MeanderingProgrammer/render-markdown.nvim") },
})

local opts = {
  heading = {
    -- stylua: ignore start
    icons = { "󰼏  ", "󰎨  ", "󰼑  ", "󰎲  ", "󰼓 ", "󰎴 ", },
    -- stylua: ignore end
    -- render hightlight in all modes
    render_modes = true,
  },
  sign = { enabled = false },
  code = {
    render_modes = true,
    disable_background = true, -- disable background of block
    highlight_border = false, -- diable background of language
  },
  anti_conceal = {
    disabled_modes = { "n" },
    ignore = {
      bullet = true,
      head_border = true,
      head_background = true,
    },
  },
  overrides = {
    buftype = {
      -- don't render language on lsp hover doc
      nofile = { code = { language = false } },
    },
  },
}

require("render-markdown").setup(opts)

-- lz.by_filetypes("render-markdown", "SetupRenderMarkdown", "markdown", opts)

vim.keymap.set("n", "<leader>tm", function()
  require("render-markdown").buf_toggle()
end, { desc = "Toggle Buf Markdown Render" })
