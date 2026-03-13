if not vim.g.vscode then
  require("utils")
  require("autocmd")
  require("options")
  require("keymaps")
  require("lsp")
  require("pluginmanager")
  require("config.terminal")
else
  require("vscodeonly")
  require("pluginmanager")
end

