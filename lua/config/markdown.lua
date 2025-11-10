---@module 'render-markdown'
---@type render.md.UserConfig
return {
  heading = {
    -- stylua: ignore start
    icons = { "󰼏  ", "󰎨  ", "󰼑  ", "󰎲  ", "󰼓 ", "󰎴 ", },
    -- stylua: ignore end
    -- render hightlight in all modes
    render_modes = true,
  },
  sign = { enabled = false },
  code = {
    render_modes = true,
    disable_background = true, -- disable background of block
    highlight_border = false, -- diable background of language
  },
  anti_conceal = {
    disabled_modes = { "n" },
    ignore = {
      bullet = true,
      head_border = true,
      head_background = true,
    },
  },
  overrides = {
    buftype = {
      -- don't render language on lsp hover doc
      nofile = { code = { language = false } },
    },
  },
}
