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

  local trouble = require("trouble")
  -- Buffer
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- stylua: ignore start
  map("n", "<leader>cl", "<cmd>LspInfo<cr>", "Lsp Info")
  map("n", "gd", function() trouble.toggle("lsp_definitions") end, "Goto Definition")
  map("n", "gD", function () trouble.toggle("lsp_declarations") end, "Goto Declaration")
  map("n", "gi", function () trouble.toggle("lsp_implementations") end, "Goto implementation")
  map("n", "gr", function () trouble.toggle("lsp_references") end, "Goto References")
  map("n", "gy", function () trouble.toggle("lsp_type_definitions") end, "Goto T[y]pe definition")
  -- stylua: ignore start
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
