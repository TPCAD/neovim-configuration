-- return {
--   "folke/trouble.nvim",
--   cond = not vim.g.vscode,
--   cmd = "Trouble",
--   keys = {
--     { "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble: Diagnostics" },
--     { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble: Buffer Diagnostics" },
--     { "<leader>cs", "<cmd>Trouble symbols toggle<cr>", desc = "Trouble: Symbols" },
--     { "<leader>cd", "<cmd>Trouble lsp_document_symbols toggle<cr>", desc = "Trouble: Document Symbols" },
--     { "<leader>cS", "<cmd>Trouble lsp toggle<cr>", desc = "Trouble: LSP references/definitions/..." },
--     { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Trouble: Location List" },
--     { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Trouble: Quickfix List" },
--     {
--       "[q",
--       function()
--         if require("trouble").is_open() then
--           require("trouble").prev({ skip_groups = true, jump = true })
--         else
--           local ok, err = pcall(vim.cmd.cprev)
--           if not ok then
--             vim.notify(err, vim.log.levels.ERROR)
--           end
--         end
--       end,
--       desc = "Previous Trouble/Quickfix Item",
--     },
--     {
--       "]q",
--       function()
--         if require("trouble").is_open() then
--           require("trouble").next({ skip_groups = true, jump = true })
--         else
--           local ok, err = pcall(vim.cmd.cnext)
--           if not ok then
--             vim.notify(err, vim.log.levels.ERROR)
--           end
--         end
--       end,
--       desc = "Next Trouble/Quickfix Item",
--     },
--   },
--   opts = {
--     focus = true,
--     keys = { ["<cr>"] = "jump_close", o = "jump" },
--   }, -- for default options, refer to the configuration section for custom setup.
-- }

vim.pack.add({
  { src = vim.g.gh_plugin_link("folke/trouble.nvim") },
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
  group = vim.api.nvim_create_augroup("SetupTrouble", { clear = true }),
  once = true,
  callback = function()
    require("trouble").setup({
      focus = true,
      keys = { ["<cr>"] = "jump_close", o = "jump" },
    })

    vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble: Diagnostics" })
    vim.keymap.set(
      "n",
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      { desc = "Trouble: Buffer Diagnostics" }
    )
    vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle<cr>", { desc = "Trouble: Symbols" })
    vim.keymap.set(
      "n",
      "<leader>cd",
      "<cmd>Trouble lsp_document_symbols toggle<cr>",
      { desc = "Trouble: Document Symbols" }
    )
    vim.keymap.set(
      "n",
      "<leader>cS",
      "<cmd>Trouble lsp toggle<cr>",
      { desc = "Trouble: LSP references/definitions/..." }
    )
    vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Trouble: Location List" })
    vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Trouble: Quickfix List" })

    vim.keymap.set("n", "[q", function()
      if require("trouble").is_open() then
        require("trouble").prev({ skip_groups = true, jump = true })
      else
        local ok, err = pcall(vim.cmd.cprev)
        if not ok then
          vim.notify(err, vim.log.levels.ERROR)
        end
      end
    end, { desc = "Previous Trouble/Quickfix Item" })

    vim.keymap.set("n", "]q", function()
      if require("trouble").is_open() then
        require("trouble").next({ skip_groups = true, jump = true })
      else
        local ok, err = pcall(vim.cmd.cnext)
        if not ok then
          vim.notify(err, vim.log.levels.ERROR)
        end
      end
    end, { desc = "Next Trouble/Quickfix Item" })
  end,
})
