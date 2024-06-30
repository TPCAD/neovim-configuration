if vim.g.vscode then
  require("config.vscode")
else
  require("config.autocmd")
  require("config.basic")
  require("config.keymaps")
  require("config.plugins")
  require("utils.colorscheme")
end
