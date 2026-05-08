vim.pack.add({
  { src = "https://github.com/folke/flash.nvim" },
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("SetupFlash", { clear = true }),
  once = true,
  callback = function()
    require("flash").setup({
      jump = {
        autojump = true,
      },
      modes = {
        char = {
          keys = { "f", "F", "t", "T", ";", "," },
        },
      },
    })
  end,
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
