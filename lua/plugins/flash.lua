local lz = require("utils").lazyload

vim.pack.add({
  { src = lz.gh_link("folke/flash.nvim") },
})

lz.by_events("flash", { "BufReadPost", "BufNewFile" }, "SetupFlash", {
  jump = {
    autojump = true,
  },
  modes = {
    char = {
      keys = { "f", "F", "t", "T", ";", "," },
    },
  },
})

vim.keymap.set({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set({ "n", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })

vim.keymap.set("o", "r", function()
  require("flash").remote()
end, { desc = "Remote Flash" })

vim.keymap.set({ "o", "x" }, "R", function()
  require("flash").treesitter_search()
end, { desc = "Treesitter Search" })

-- toggle flash while using regular search
vim.keymap.set({ "c" }, "<c-o>", function()
  require("flash").toggle()
end, { desc = "Toggle Flash Search" })
