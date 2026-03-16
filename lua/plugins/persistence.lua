local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("folke/persistence.nvim") },
})

lz.by_events("persistence", "BufReadPre", "SetupPersistence")

lz.by_keys("persistence", "n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "Restore Session" })

lz.by_keys("persistence", "n", "<leader>qS", function()
  require("persistence").select()
end, { desc = "Select Session" })

lz.by_keys("persistence", "n", "<leader>ql", function()
  require("persistence").load({ last = true })
end, { desc = "Restore Last Session" })

lz.by_keys("persistence", "n", "<leader>qd", function()
  require("persistence").stop()
end, { desc = "Don't Save Current Session" })
