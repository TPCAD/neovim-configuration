--- wrapper of vim.keymap.set
---@param lhs string
---@param rhs string|function
---@param desc string
local function map(lhs, rhs, desc)
  vim.keymap.set("n", lhs, rhs, { desc = desc })
end

-- picker mappings
-- stylua: ignore start
map("<leader><space>", Snacks.picker.smart, "Find Files")
map("<leader>,", Snacks.picker.buffers, "Buffers")
map("<leader>/", Snacks.picker.grep, "Grep")
map("<leader>:", Snacks.picker.command_history, "Command History")
map("<leader>n", function ()
  if Snacks.config.picker and Snacks.config.picker.enabled then
    Snacks.picker.notifications()
  else
    Snacks.notifier.show_history()
  end
end, "Notifications")

-- find files
map("<leader>ff", Snacks.picker.files, "Find Files")
map("<leader>fc", function () Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, "Find Config Files")
map("<leader>fb", Snacks.picker.buffers, "Buffers")
map("<leader>fg", Snacks.picker.git_files, "Git Files")
map("<leader>fr", Snacks.picker.recent, "Recent Files")
map("<leader>fh", Snacks.picker.help, "Help Files")

-- search
map("<leader>sb", Snacks.picker.lines, "Buffer Lines")
map("<leader>sB", Snacks.picker.grep_buffers, "Grep Open Buffers")
map("<leader>sg", Snacks.picker.grep, "Grep")
map("<leader>sw", Snacks.picker.grep_word, "Grep Word")
map("<leader>sc", Snacks.picker.command_history, "Command History")
map("<leader>sC", Snacks.picker.commands, "Commands")
map("<leader>sd", Snacks.picker.diagnostics_buffer, "Diagnostics(Current Buffer)")
map("<leader>sD", Snacks.picker.diagnostics, "Diagnostics")
map("<leader>st", function () Snacks.picker.todo_comments() end, "Todo")
map("<leader>sT", function () Snacks.picker.todo_comments({keywords = {"TODO","FIX","FIXME"}}) end, "Todo/Fix/Fixme")
map("<leader>sh", Snacks.picker.highlights, "Highlights")
map("<leader>sk", Snacks.picker.keymaps, "Keymaps")
map("<leader>sm", Snacks.picker.marks, "Marks")
map("<leader>sl", Snacks.picker.loclist, "Location List")
map("<leader>sq", Snacks.picker.qflist, "Quickfix")
map("<leader>sj", Snacks.picker.jumps, "Jumps")
map("<leader>sM", Snacks.picker.man, "Man Pages")
map("<leader>sa", Snacks.picker.autocmds, "Autocmds")
map('<leader>s"', Snacks.picker.registers, "Registers")
map("<leader>su", Snacks.picker.undo, "Undo History")
map("<leader>s/", Snacks.picker.search_history, "Search History")
map("<leader>si", Snacks.picker.icons, "Icons")
map("<leader>tc", Snacks.picker.colorschemes, "Colorschemes")
map("<leader>sp", Snacks.picker.lazy, "Search for Plugin Spec")
map("<leader>sR", Snacks.picker.resume, "Resume")
-- stylua: ignore end

-- lazygit
-- TODO: check cwd is git repo
if vim.fn.executable("lazygit") == 1 then
  vim.keymap.set("n", "<leader>gg", function()
    Snacks.lazygit()
  end, { desc = "Lazygit" })
end

vim.keymap.set("n", "<leader>lt", function()
  Snacks.terminal(nil, {
    env = { is_float = "yes" },
    win = {
      position = "float",
      width = 0.8,
      height = 0.8,
      border = "rounded",
      backdrop = false,
      wo = {
        winhighlight = "Normal:Normal",
      },
    },
  })
end, { desc = "Floating Terminal" })

return {
  bigfile = { enabled = true },
  notifier = { enabled = true },
  quickfile = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  picker = { enabled = true },
  input = { enabled = true },
  styles = {
    notification_history = {
      width = 0.8,
    },
  },
}
