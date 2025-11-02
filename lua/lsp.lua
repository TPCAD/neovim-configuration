vim.lsp.enable("asm_lsp")
vim.lsp.enable("bashls")
-- vim.lsp.enable("rust_analyzer")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attch", { clear = true }),
  callback = function(event)
    ---@param mode string|string[] short-name of vim mode
    ---@param lhs string left-hand side of mapping
    ---@param rhs string|function right-hand side of mapping
    ---@param desc string description
    local map = function(mode, lhs, rhs, desc)
      if desc then
        desc = "LSP: " .. desc
      end
      vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
    end

    -- diagnostic
    vim.diagnostic.config({
      virtual_text = true,
      severity_sort = true,
      float = { severity_sort = true, border = "rounded" },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "◍ ",
          [vim.diagnostic.severity.WARN] = "◍ ",
          [vim.diagnostic.severity.INFO] = "◍ ",
          [vim.diagnostic.severity.HINT] = "◍ ",
        },
      },
    })
    -- open float diagnostic
    map("n", "<leader>co", function()
      vim.diagnostic.open_float({ source = true })
    end, "Line Diagnostics")
    -- toggle diagnostic
    map("n", "<leader>td", function()
      local config = vim.diagnostic.config()
      ---@diagnostic disable-next-line: need-check-nil
      local enabled = not config.virtual_text
      vim.diagnostic.config({ underline = enabled, virtual_text = enabled, signs = enabled, update_in_insert = enabled })
      vim.notify("LSP: Diagnostic " .. (enabled and "Enabled" or "Diabled"), vim.log.levels.INFO)
    end, "Toggle Diagnostic")

    ---@param next integer Next or previous diagnostic
    ---@param severity string|integer? Diagnostic severity
    local diagnostic_goto = function(next, severity)
      severity = severity and vim.diagnostic.severity[severity] or nil
      return function()
        vim.diagnostic.jump({ count = next, severity = severity, float = true })
      end
    end
    -- useful mapping to diagnostic navigation
    vim.keymap.set("n", "]d", diagnostic_goto(1), { desc = "Next Diagnostic" })
    map("n", "[d", diagnostic_goto(-1), "Prev Diagnostic")
    map("n", "]e", diagnostic_goto(1, "ERROR"), "Next Error")
    map("n", "[e", diagnostic_goto(-1, "ERROR"), "Prev Error")
    map("n", "]w", diagnostic_goto(1, "WARN"), "Next Warning")
    map("n", "[w", diagnostic_goto(-1, "WARN"), "Prev Warning")
    -- vim.keymap.del("n", "<C-w>d")
    -- vim.keymap.del("n", "<C-w><C-d>")

    local client = vim.lsp.get_client_by_id(event.data.client_id)

    -- folding method if lsp support
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_foldingRange) then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end

    -- enable inlay hints if possible
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      map("n", "<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
      end, "Toggle Inlay Hints")
    end

    -- lsp keymaps
    -- local trouble = require("trouble")

    map("n", "<leader>cl", "<cmd>checkhealth vim.lsp<cr>", "Lsp Info")

    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map({ "n", "v" }, "gra", vim.lsp.buf.code_action, "Code Action")

    map("n", "gri", function()
      Snacks.picker.lsp_implementations()
      -- trouble.toggle("lsp_implementations")
    end, "Goto Implementation")

    map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
    map("n", "grn", vim.lsp.buf.rename, "Rename")

    map("n", "grr", function()
      Snacks.picker.lsp_references()
      -- trouble.toggle("lsp_references")
    end, "Goto References")

    map("n", "grt", function()
      -- trouble.toggle("lsp_type_definitions")
      Snacks.picker.lsp_type_definitions()
    end, "Goto Type Definition")

    map("n", "gd", function()
      -- trouble.toggle("lsp_definitions")
      Snacks.picker.lsp_definitions()
    end, "Goto Definition")

    map("n", "gD", function()
      -- trouble.toggle("lsp_declarations")
      Snacks.picker.lsp_declarations()
    end, "Goto Declaration")

    map("n", "K", vim.lsp.buf.hover, "Hover")
    map("n", "gK", vim.lsp.buf.signature_help, "Signature Help")

    map("n", "gO", Snacks.picker.lsp_symbols, "LSP: Symbols")
    -- word
    -- stylua: ignore start
    map("n", "]]", function() Snacks.words.jump(vim.v.count1) end, "Next References")
    map("n", "[[", function() Snacks.words.jump(-vim.v.count1) end, "Prev References")
    -- stylua: ignore start
    -- workspace
    map("n", "<leader>cwa", vim.lsp.buf.add_workspace_folder, "Add Workspace Folder")
    map("n", "<leader>cwr", vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder")
    map("n", "<leader>cwl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "List Workspace Folders")
  end,
})

vim.api.nvim_create_user_command("LspInfo", ":checkhealth vim.lsp", { desc = "Lsp Info" })
