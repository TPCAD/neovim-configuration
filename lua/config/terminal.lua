vim.g.term_bufnr = 0

local toggle_terminal_buffer = function()
  -- switch to alternate buf if terminal buffer is normal mode
  if vim.g.term_bufnr == vim.api.nvim_win_get_buf(0) then
    vim.cmd("b#")
    return
  end

  -- switch to terminal buffer if exist
  if vim.g.term_bufnr ~= 0 then
    vim.api.nvim_win_set_buf(0, vim.g.term_bufnr)
    vim.cmd("startinsert")
    return
  end

  -- create a terminal buffer if not exist
  vim.cmd.term()
  vim.cmd("startinsert")

  vim.g.term_bufnr = vim.api.nvim_win_get_buf(0)
  vim.bo[vim.g.term_bufnr].filetype = "terminal" -- name terminal bufffer
  vim.bo[vim.g.term_bufnr].buflisted = false -- hide terminal buffer
  vim.api.nvim_create_autocmd("TermEnter", { -- set terminal buffer
    group = vim.api.nvim_create_augroup("CustomTerminal", { clear = true }),
    callback = function()
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
      vim.opt_local.numberwidth = 1
    end,
  })

  vim.api.nvim_create_autocmd("TermClose", { -- set global varibale when kill terminal buffer
    group = vim.api.nvim_create_augroup("CustomTerminal", { clear = false }),
    callback = function()
      vim.g.term_bufnr = 0
    end,
  })
end

-- keymap for terminal buffer
vim.keymap.set("n", "<C-_>", toggle_terminal_buffer, { desc = "Toggle Terminal Buffer" })
vim.keymap.set("n", "<C-/>", toggle_terminal_buffer, { desc = "Toggle Terminal Buffer" })

vim.keymap.set("t", "<C-_>", "<cmd>b#<cr>", { desc = "Toggle Terminal Buffer" })
vim.keymap.set("t", "<C-/>", "<cmd>b#<cr>", { desc = "Toggle Terminal Buffer" })

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Enter Normal Mode" })
