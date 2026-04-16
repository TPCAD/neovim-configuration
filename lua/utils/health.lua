-- 1. check version >= 0.12
-- 2. check clipboard
-- 3. check is wsl

local utils = require("utils")

local check_version = function()
  local verstr = tostring(vim.version())
  if not vim.version.ge then
    vim.health.error(string.format("Neovim out of date: '%s'. Upgrade to latest stable or nightly", verstr))
    return
  end

  if vim.version.ge(vim.version(), "0.12") then
    vim.health.ok(string.format("Neovim version: '%s'", verstr))
  else
    vim.health.error(string.format("Neovim out of date: '%s'. Neovim 0.12+ is needed", verstr))
  end
end

local check_clipboard = function()
  if utils.clipboard == "" then
    vim.health.error("No clipboard found")
    return
  end

  vim.health.ok(string.format("Found %s", utils.clipboard))
end

local function check_wsl()
  if utils.is_wsl then
    vim.health.ok([[WSL is detected and supported]])
  end
end

return {
  check = function()
    vim.health.start("Dioptra.Version")
    vim.health.info([[Neovim 0.12+ is needed.]])
    check_version()

    vim.health.start("Dioptra.WSL")
    check_wsl()

    local uv = vim.uv or vim.loop
    vim.health.info("System Info: " .. vim.inspect(uv.os_uname()))


    vim.health.start("Dioptra.Clipboard")
    check_clipboard()
  end,
}
