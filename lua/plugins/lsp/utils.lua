local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  -- enable inlay hints
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end

  local map = function(modes, keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end
    vim.keymap.set(modes, keys, func, { buffer = bufnr, desc = desc })
  end

  -- Buffer
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map("n", "<leader>cl", "<cmd>LspInfo<cr>", "Lsp Info")
  map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
  map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
  map("n", "gi", vim.lsp.buf.implementation, "Goto implementation")
  map("n", "gy", vim.lsp.buf.type_definition, "Goto T[y]pe definition")
  map("n", "gr", vim.lsp.buf.references, "Goto References")
  map("n", "K", vim.lsp.buf.hover, "Hover")
  map("n", "gK", vim.lsp.buf.signature_help, "Signature Help")
  map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
  -- word
  -- stylua: ignore start
  map("n", "]]", function() Snacks.words.jump(vim.v.count1) end, "Next References")
  map("n", "[[", function() Snacks.words.jump(-vim.v.count1) end, "Prev References")
  map("n", "<A-n>", function() Snacks.words.jump(vim.v.count1) end, "Next References")
  map("n", "<A-p>", function() Snacks.words.jump(-vim.v.count1) end, "Prev References")
  -- stylua: ignore start
  -- workspace
  map("n", "<leader>cwa", vim.lsp.buf.add_workspace_folder, "Add Workspace Folder")
  map("n", "<leader>cwr", vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder")
  map("n", "<leader>cwl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "List Workspace Folders")
end

return on_attach
