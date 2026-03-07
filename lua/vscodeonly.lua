if not vim.g.vscode then
    return
end

local vscode = require("vscode")

vim.g.mapleader = ";"
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<space>", ":", { desc = "Enter Command Mode" })

-- tab
vim.keymap.set("n", "<Tab>", function ()
    vscode.call("workbench.action.nextEditor")
end)
vim.keymap.set("n", "<S-Tab>", function ()
    vscode.call("workbench.action.previousEditor")
end)

vim.keymap.set("n", "<leader>bd", function ()
    vscode.call("workbench.action.closeActiveEditor")
end)

-- noh
vim.keymap.set({ "n", "i" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- file explorer
vim.keymap.set("n", "<leader>en", function ()
    vscode.call("workbench.files.action.focusFilesExplorer")
end)
vim.keymap.set("n", "<leader>ee", function()
    vscode.call("yazi-vscode.toggle")
end)

-- sidebar
vim.keymap.set("n", "<leader>ts", function ()
    vscode.call("workbench.action.toggleSidebarVisibility")
end)

-- search
vim.keymap.set("n", "<leader>/", function ()
    vscode.call("workbench.action.findInFiles")
end)

vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")

-- problems list
vim.keymap.set("n", "<leader>q", function ()
    vscode.call("workbench.actions.view.problems")
end)

-- terminal 
-- vscode-neovim api can not close the terminal when focus terminal. Leave vscode to handle this
--
-- vim.keymap.set("n", "<C-/>", function ()
--     vscode.call("workbench.action.terminal.toggleTerminal")
-- end)


-- highlight yanked content
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  pattern = { "*" },
  callback = function()
    vim.highlight.on_yank({
      timeout = 300,
    })
  end,
})