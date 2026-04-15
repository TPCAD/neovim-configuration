local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("TPCAD/lantern.nvim") },
})

lz.by_keys("lantern", "n", "<leader>ct", function()
  require("lantern").open()
end, { desc = "Toggle lantern dashboard" })
