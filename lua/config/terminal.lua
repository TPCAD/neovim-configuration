---@type integer
vim.g.term_bufnr = 0

local toggle_terminal_buffer = function()
  -- delete existing terminal when first open nvim
  if vim.g.term_bufnr == 0 then
    local buf_list = vim.api.nvim_list_bufs()
    for _, bufnr in ipairs(buf_list) do
      if string.find(vim.fn.bufname(bufnr), "^term://.*") then
        vim.api.nvim_buf_delete(bufnr, { force = true, unload = false })
      end
    end
  end

  -- switch to alternate buf if terminal buffer is normal mode
  if vim.g.term_bufnr == vim.api.nvim_win_get_buf(0) then
    vim.cmd("b#")
    return
  end

  -- switch to terminal buffer if exist
  if vim.g.term_bufnr ~= 0 and vim.api.nvim_buf_is_valid(vim.g.term_bufnr) then
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
end

-- configure terminal buffer
vim.api.nvim_create_autocmd("TermEnter", {
  group = vim.api.nvim_create_augroup("CustomTerminal", { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.numberwidth = 1
  end,
})

-- keymap for terminal buffer
vim.keymap.set({ "n", "t" }, "<C-_>", toggle_terminal_buffer, { desc = "Toggle Terminal Buffer" })
vim.keymap.set({ "n", "t" }, "<C-/>", toggle_terminal_buffer, { desc = "Toggle Terminal Buffer" })

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Enter Normal Mode" })
