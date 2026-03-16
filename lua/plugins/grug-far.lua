local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("MagicDuck/grug-far.nvim") },
})

lz.by_keys("grug-far", { "n", "v" }, "<leader>sr", function()
  local grug = require("grug-far")
  local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
  grug.open({
    transient = true,
    prefills = {
      filesFilter = ext and ext ~= "" and "*." .. ext or nil,
    },
  })
end, { desc = "Search and Replace" })
