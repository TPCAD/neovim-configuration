---lazy load plugins by keymap
---@param module string plugin name
---@param modes string|string[] keymap modes
---@param lhs string lhs
---@param rhs string|function rhs
---@param keymap_opts vim.keymap.set.Opts
---@param plugin_opts? table plugin setup options
local function lazy_by_keys(module, modes, lhs, rhs, keymap_opts, plugin_opts)
  vim.keymap.set(modes, lhs, function()
    if not package.loaded[module] then
      require(module).setup(plugin_opts)
    end

    if vim.is_callable(rhs) then
      rhs()
      return
    end

    vim.cmd(rhs)
  end, keymap_opts)
end

---lazy load plugins by events
---@param module string plugin name
---@param events string|string[] event lists
---@param group string group name
---@param opts table? plugin setup options
---@param after_setup_hook function? function executed after setup
local function lazy_by_events(module, events, group, opts, after_setup_hook)
  vim.api.nvim_create_autocmd(events, {
    group = vim.api.nvim_create_augroup(group, { clear = true }),
    once = true,
    callback = function()
      require(module).setup(opts)
      if after_setup_hook then
        after_setup_hook()
      end
    end,
  })
end

---lazy load plugins by file types
---@param module string plugin name
---@param group string group name
---@param pattern string|string[] file types
---@param opts table? plugin setup options
local function lazy_by_filetypes(module, group, pattern, opts)
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup(group, { clear = true }),
    pattern = pattern,
    once = true,
    callback = function()
      require(module).setup(opts)
    end,
  })
end

---generate github link
---@param name string
---@return string
local function gh_link(name)
  if string.match(name, ".*/.*") then
    return "https://github.com/" .. name
  end

  return ""
end

return {
  by_keys = lazy_by_keys,
  by_events = lazy_by_events,
  by_filetypes = lazy_by_filetypes,
  gh_link = gh_link,
}
