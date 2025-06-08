vim.lsp.enable("asm_lsp")
vim.lsp.enable("bashls")
vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("rust_analyzer")

vim.lsp.config("*", {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      },
    },
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attch", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    local map = function(modes, keys, func, desc)
      if desc then
        desc = "LSP: " .. desc
      end
      vim.keymap.set(modes, keys, func, { buffer = event.buf, desc = desc })
    end

    -- enable inlay hints if possible
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      map("n", "<leader>ch", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
      end, "LSP: Toggle Inlay Hints")
    end

    -- keymaps
    local trouble = require("trouble")

    map("n", "<leader>cl", "<cmd>checkhealth vim.lsp<cr>", "Lsp Info")
    -- stylua: ignore start
    map("n", "gd", function() trouble.toggle("lsp_definitions") end, "Goto Definition")
    map("n", "gD", function() trouble.toggle("lsp_declarations") end, "Goto Declaration")
    map("n", "gi", function() trouble.toggle("lsp_implementations") end, "Goto implementation")
    map("n", "gr", function() trouble.toggle("lsp_references") end, "Goto References")
    map("n", "gy", function() trouble.toggle("lsp_type_definitions") end, "Goto T[y]pe definition")
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
  end,
})
