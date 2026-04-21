-- Setup nvim-dap, including adapter definitions,
-- per-language debug configurations, keymaps and ui.

local dap = require("dap")

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "OpenDebugAD7",
}

dap.adapters.codelldb = {
  type = "executable",
  command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"
}

-- adapter to debug nvim plugins
dap.adapters.nlua = function(callback, config)
  callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
end

-- configurations for Rust
dap.configurations.rust = dap.configurations.rust or {}
vim.list_extend(dap.configurations.rust, {
  {
    name = "LLDB(General)",
    type = "codelldb",
    request = "launch",
    program = function()
      local cwd = vim.fn.getcwd()
      local dirname = vim.fn.fnamemodify(cwd, ":t")
      return vim.fn.input("Path to executable: ", cwd .. "/target/debug/" .. dirname, "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
  {
    name = "LLDB(Spec)",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
})

-- configurations for C/C++
dap.configurations.cpp = dap.configurations.cpp or {}
vim.list_extend(dap.configurations.cpp, {
  {
    name = "Launch (codelldb)",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  },
  {
    name = "Attach to gdbserver :1234",
    type = "cppdbg",
    request = "launch",
    MIMode = "gdb",
    miDebuggerServerAddress = "localhost:1234",
    miDebuggerPath = "/usr/bin/gdb",
    cwd = "${workspaceFolder}",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
  },
})

-- configurations for debuggin nvim plugins
dap.configurations.lua = dap.configurations.lua or {}
dap.configurations.lua = {
  {
    type = "nlua",
    request = "attach",
    name = "Attach to running Neovim instance",
  },
}

-- configurations for python
local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
require("dap-python").setup(path)

-- UI for nvim-dap
require("dap-view").setup({
  winbar = {
    sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "console" },
    default_section = "scopes",
    controls = {
      enabled = true,
    },
  },
  windows = {
    size = 0.5,
    position = "right",
    terminal = {
      size = 0,
      position = "below",
    },
  },
  virtual_text = {
    enabled = true,
    format = function(variable, _, _)
      return ": " .. variable.value
    end,
  },
})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", {
  text = "",
  texthl = "DapBreakpointCondition",
  linehl = "DapBreakpointCondition",
  numhl = "DapBreakpointCondition",
})
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

-- keymaps for debugging

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
  require("dap-view").toggle()
  -- custom_utils.reset_overseerlist_width()
end, { desc = "DAP: Toggle UI" })
vim.keymap.set("n", "<F1>", function()
  require("dap-view").toggle()
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
map("n", "<leader>dq", dap.terminate, "Terminate Session")
map("n", "<F7>", dap.terminate, "Terminate Session")

map("n", "<leader>dQ", dap.close, "Close Session")

map("n", "<leader>dr", dap.run_to_cursor, "Run to Cursor")
map("n", "<leader>dR", dap.repl.toggle, "Toggle REPL")
map("n", "<leader>dh", require("dap.ui.widgets").hover, "Hover")

map("n", "<leader>db", dap.toggle_breakpoint, "Breakpoint")
map("n", "<leader>dB", function()
  local input = vim.fn.input("Condition for breakpoint:")
  dap.set_breakpoint(input)
end, "Conditional Breakpoint")
map("n", "<leader>dD", dap.clear_breakpoints, "Clear Breakpoints")
