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

dap.adapters.nlua = function(callback, config)
  callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
end

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

dap.configurations.lua = {
  {
    type = "nlua",
    request = "attach",
    name = "Attach to running Neovim instance",
  },
}
