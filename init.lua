local utils = require("utils")

-- Searching system clipboard would cost a lot of time, especially in WSL.
-- Specify clipboard to speed up the startup time.
vim.g.clipboard = utils.clipboard

if not vim.g.vscode then
  require("autocmd")
  require("options")
  require("folding")
  require("keymaps")
  require("lsp")
  require("plugins")
  require("dioptra.terminal")
  require("dioptra.ensure_installed")
else
  require("vscodeonly")
end
