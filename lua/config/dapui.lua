require("nvim-dap-virtual-text").setup({})

local dap, dapui = require("dap"), require("dapui")

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- Custom breakpoint icons
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", {
  text = "",
  texthl = "DapBreakpointCondition",
  linehl = "DapBreakpointCondition",
  numhl = "DapBreakpointCondition",
})
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

---@param mode string|string[] short-name of vim mode
---@param lhs string left-hand side of mapping
---@param rhs string|function right-hand side of mapping
---@param desc string description
local map = function(mode, lhs, rhs, desc)
  if desc then
    desc = "DAP: " .. desc
  end
  vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

-- keymaps
vim.keymap.set("n", "<leader>du", function()
  dapui.toggle({ reset = true })
  -- custom_utils.reset_overseerlist_width()
end, { desc = "DAP: Toggle UI" })
vim.keymap.set("n", "<F1>", function()
  dapui.toggle({ reset = true })
  -- custom_utils.reset_overseerlist_width()
end, { desc = "DAP: Toggle UI" })

map("n", "<leader>dc", dap.continue, "Start/Continue")
map("n", "<F5>", dap.continue, "Start/Continue")
map("n", "<leader>do", dap.step_over, "Step Over")
map("n", "<F10>", dap.step_over, "Step Over")
map("n", "<leader>di", dap.step_into, "Step into")
map("n", "<F11>", dap.step_into, "Step into")
map("n", "<leader>dO", dap.step_out, "Step Out")
map("n", "<F12>", dap.step_out, "Step Out")
map("n", "<F6>", dap.restart, "Start Over")
map("n", "<F6>", function()
  pcall(function()
    dap.terminate()
  end)
  vim.defer_fn(function()
    pcall(function()
      dap.continue()
    end)
  end, 500)
end, "Start Over")
map("n", "<leader>dQ", dap.terminate, "Terminate Session")
map("n", "<F7>", dap.terminate, "Terminate Session")

map("n", "<leader>dq", dap.close, "Close Session")

map("n", "<leader>dr", dap.run_to_cursor, "Run to Cursor")
map("n", "<leader>dR", dap.repl.toggle, "Toggle REPL")
map("n", "<leader>dh", require("dap.ui.widgets").hover, "Hover")

map("n", "<leader>db", dap.toggle_breakpoint, "Breakpoint")
map("n", "<leader>dB", function()
  local input = vim.fn.input("Condition for breakpoint:")
  dap.set_breakpoint(input)
end, "Conditional Breakpoint")
map("n", "<leader>dD", dap.clear_breakpoints, "Clear Breakpoints")

-- vim.keymap.set("n", "<leader>dr", dap.restart_frame, { desc = "DAP: Restart frame" })

if vim.bo.filetype == "lua" then
  return {
    layouts = {
      {
        position = "bottom",
        size = 0.4,
        elements = {
          { id = "scopes", size = 1 },
        },
      },
    },
  }
end

return {}
