local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("nvim-lualine/lualine.nvim") },
  { src = lz.gh_link("nvim-tree/nvim-web-devicons") },
})

lz.by_events("lualine", "BufEnter", "SetupLualine", {
  sections = {
    lualine_c = { "filename" },
    lualine_x = { "lsp_status", "encoding", "fileformat", "filetype" },
  },
  -- not compatible with nvim-dap-ui control icons
  -- the dap-repl's control icons will disappear if winbar is set
  -- winbar = {
  --   lualine_c = {}
  -- },
  extensions = { "nvim-tree", "trouble", "nvim-dap-ui", "lazy" },
})

-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   group = vim.api.nvim_create_augroup("SetupLualine", { clear = true }),
--   once = true,
--   callback = function()
--     local opts = {
--       sections = {
--         lualine_c = { "filename" },
--         lualine_x = { "lsp_status", "encoding", "fileformat", "filetype" },
--       },
--       -- not compatible with nvim-dap-ui control icons
--       -- the dap-repl's control icons will disappear if winbar is set
--       -- winbar = {
--       --   lualine_c = {}
--       -- },
--       extensions = { "nvim-tree", "trouble", "nvim-dap-ui", "lazy" },
--     }
--
--     -- add trouble symbols to lualine
--     local trouble = vim.g.safe_require("trouble")
--     if trouble then
--       local symbols = trouble.statusline({
--         mode = "symbols",
--         groups = {},
--         title = false,
--         filter = { range = true },
--         format = "{kind_icon}{symbol.name:Normal}",
--         -- The following line is needed to fix the background color
--         -- Set it to the lualine section you want to use
--         hl_group = "lualine_c_normal",
--       })
--
--       table.insert(opts.sections.lualine_c, {
--         symbols.get,
--         cond = symbols.has,
--       })
--     end
--
--     require("lualine").setup(opts)
--   end,
-- })
