local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  local nmap = function(modes, keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end
    vim.keymap.set(modes, keys, func, { buffer = bufnr, desc = desc })
  end

  -- Buffer
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  nmap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
  nmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
  nmap("n", "K", vim.lsp.buf.hover, "Hover")
  nmap("n", "gm", vim.lsp.buf.implementation, "Go to implementation")
  nmap("n", "<C-s>", vim.lsp.buf.signature_help, "Signature help")
  nmap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
  nmap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
  nmap("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "List workspace folders")
  nmap("n", "<leader>D", vim.lsp.buf.type_definition, "Type definition")
  nmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
  nmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
  nmap("n", "gr", vim.lsp.buf.references, "Go to references")
  -- Diagnostic keymap
  nmap("n", "<space>e", vim.diagnostic.open_float, "Show diagnostic info")
  nmap("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")
  nmap("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic")
  nmap("n", "<leader>q", vim.diagnostic.setloclist, "")
end

return on_attach
