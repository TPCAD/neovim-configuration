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

return M
