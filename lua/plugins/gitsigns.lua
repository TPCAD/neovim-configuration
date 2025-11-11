return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        opts.desc = "Git: " .. opts.desc
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end, { desc = "Next Hunk" })

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end, { desc = "Prev Hunk" })

      -- Actions
      map("v", "<leader>gs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Stage Hunk" })
      map("v", "<leader>gr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Reset Hunk" })
      -- normal mode
      map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Toggle Stage Hunk" })
      map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
      map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
      map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset Buffer" })
      map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
      map("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff Against Index" })
      map("n", "<leader>gD", function()
        gitsigns.diffthis("@")
      end, { desc = "Diff Against Last Commit" })
      map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle Blame Line" })
      map("n", "<leader>tD", gitsigns.preview_hunk_inline, { desc = "Toggle Inline Hunk Preview" })
      map("n", "<leader>tg", gitsigns.toggle_signs, { desc = "Toggle Git Signs" })
    end,
  },
}
