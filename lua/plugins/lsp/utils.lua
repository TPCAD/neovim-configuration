local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  local nmap = function(modes, keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end
    vim.keymap.set(modes, keys, func, { buffer = bufnr, desc = desc })
  end

  local trouble = require("trouble")
  local lsp_func = {
    declarations = function()
      trouble.toggle("lsp_declarations")
    end,
    definitions = function()
      trouble.toggle("lsp_definitions")
    end,
    implementations = function()
      trouble.toggle("lsp_implementations")
    end,
    references = function()
      trouble.toggle("lsp_references")
    end,
    type_definitions = function()
      trouble.toggle("lsp_type_definitions")
    end,
    buffer_diagnostics = function()
      trouble.toggle({ filter = { buf = 0 }, mode = "diagnostics" })
    end,
    workspace_diagnostics = function()
      trouble.toggle({ mode = "diagnostics" })
    end,
    prev_diagnostics = function()
      vim.diagnostic.jump({ count = 1, float = true })
    end,
    next_diagnostics = function()
      vim.diagnostic.jump({ count = -1, float = true })
    end,
    qflist = function()
      trouble.toggle("quickfix")
    end,
    loclist = function()
      trouble.toggle("loclist")
    end,
    doc_symbols = function()
      trouble.toggle({ focus = true, mode = "symbols" })
    end,
    lsp_symbols = function()
      trouble.toggle("lsp_document_symbols")
    end,
  }

  -- Buffer
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  nmap("n", "gD", lsp_func.declarations, "Go to declarations")
  nmap("n", "gd", lsp_func.definitions, "Go to definition")
  nmap("n", "K", vim.lsp.buf.hover, "Hover")
  nmap("n", "gm", lsp_func.implementations, "Go to implementation")
  nmap("n", "gr", lsp_func.references, "Go to references")
  nmap("n", "<C-s>", vim.lsp.buf.signature_help, "Signature help")
  nmap("n", "<leader>D", lsp_func.type_definitions, "Type definition")
  nmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
  nmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
  -- workspace
  nmap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
  nmap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
  nmap("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "List workspace folders")
  -- Diagnostic keymap
  nmap("n", "<space>e", vim.diagnostic.open_float, "Show diagnostic info")
  nmap("n", "[d", lsp_func.prev_diagnostics, "Go to previous diagnostic")
  nmap("n", "]d", lsp_func.next_diagnostics, "Go to next diagnostic")
  nmap("n", "<leader>qb", lsp_func.buffer_diagnostics, "Buffer diagnostic")
  nmap("n", "<leader>qg", lsp_func.workspace_diagnostics, "Workspace diagnostic")
  -- quickfix
  nmap("n", "<leader>cf", lsp_func.qflist, "Quickfix list")
  nmap("n", "<leader>cl", lsp_func.loclist, "Location list")
  -- symbols
  nmap("n", "<leader>cd", lsp_func.doc_symbols, "Document symbols")
  nmap("n", "<leader>cs", lsp_func.lsp_symbols, "Document symbols")
end

return on_attach
