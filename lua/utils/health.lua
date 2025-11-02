local check_version = function()
  local verstr = tostring(vim.version())
  if not vim.version.ge then
    vim.health.error(string.format("Neovim out of date: '%s'. Upgrade to latest stable or nightly", verstr))
    return
  end

  if vim.version.ge(vim.version(), "0.11") then
    vim.health.ok(string.format("Neovim version is: '%s'", verstr))
  else
    vim.health.error(string.format("Neovim out of date: '%s'. Neovim 0.11+ is needed", verstr))
  end
end

return {
  check = function()
    vim.health.start("Custom")

    vim.health.info([[Neovim 0.11+ is needed.]])

    local uv = vim.uv or vim.loop
    vim.health.info("System Information: " .. vim.inspect(uv.os_uname()))

    check_version()
  end,
}
