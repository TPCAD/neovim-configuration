vim.pack.add({ "https://github.com/nvim-mini/mini.move" })

require("mini.move").setup({
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
    left = "<leader>mh",
    right = "<leader>ml",
    down = "<leader>mj",
    up = "<leader>mk",

    -- Move current line in Normal mode
    line_left = "<leader>mh",
    line_right = "<leader>ml",
    line_down = "<leader>mj",
    line_up = "<leader>mk",
  },

  -- Options which control moving behavior
  options = {
    -- Automatically reindent selection during linewise vertical move
    reindent_linewise = true,
  },
})
