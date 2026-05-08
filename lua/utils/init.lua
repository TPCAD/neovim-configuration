local M = {
  lazyload = require("utils.lazyload"),
}

---@param mod string Module name
---@param silent? boolean Notify or not
---@return table|nil
M.safe_require = function(mod, silent)
  local ok, m = pcall(require, mod)
  if ok then
    return m
  end

  if silent == nil then
    return nil
  end

  vim.notify(string.format("No module '%s' found.", mod))
  return nil
end

---@param mod string Module name
---@param opts? table Plugin setup options
M.safe_setup = function(mod, opts)
  if not package.loaded[mod] then
    require(mod).setup(opts)
  end
end

---check is WSL
---@return boolean
local function is_wsl()
  local uv = vim.uv or vim.loop
  return uv.fs_stat("/bin/wslinfo") ~= nil
end

---@type boolean
M.is_wsl = is_wsl()

---check system clipboard
---@return string
local function check_clipboard()
  if vim.fn.executable("xclip") == 1 then
    return "xclip"
  elseif vim.fn.executable("wl-copy") == 1 then
    return "wl-copy"
  else
    return ""
  end
end

---@type string
M.clipboard = check_clipboard()

return M
