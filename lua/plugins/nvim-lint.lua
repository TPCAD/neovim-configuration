vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-lint" },
})

require("lint").linters_by_ft = {
  sh = { "shellcheck" },
  python = { "ruff" },
}

local timers = {}

vim.api.nvim_create_autocmd({
  "BufEnter",
  "BufWritePost",
  "InsertLeave",
}, {
  callback = function(args)
    local bufnr = args.buf

    if timers[bufnr] then
      timers[bufnr]:stop()
    else
      timers[bufnr] = vim.uv.new_timer()
    end

    timers[bufnr]:start(
      100,
      0,
      vim.schedule_wrap(function()
        require("lint").try_lint()
      end)
    )
  end,
})
