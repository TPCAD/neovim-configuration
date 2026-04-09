local utils = require("utils")

-- Searching system clipboard would cost a lot of time, especially in WSL.
-- Specify clipboard to speed up the startup time.
vim.g.clipboard = utils.clipboard

if not vim.g.vscode then
  require("autocmd")
  require("options")
  require("keymaps")
  require("lsp")
  require("plugins")
  require("config.terminal")
else
  require("vscodeonly")
end
