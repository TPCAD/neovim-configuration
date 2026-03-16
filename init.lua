if not vim.g.vscode then
  require("utils")
  require("autocmd")
  require("options")
  require("keymaps")
  require("lsp")
  require("plugins")
  require("config.terminal")
else
  require("vscodeonly")
end
