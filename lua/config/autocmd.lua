-- highlight yanked content
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  pattern = { "*" },
  callback = function()
    vim.highlight.on_yank({
      timeout = 300,
    })
  end,
})

-- ignore case when type ":" to enter command mode
local cmdline_smartcase = vim.api.nvim_create_augroup("cmdline_smartcase", { clear = true })

vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
  pattern = ":",
  group = cmdline_smartcase,
  command = "set ignorecase",
})

vim.api.nvim_create_autocmd({ "CmdlineLeave" }, {
  pattern = ":",
  group = cmdline_smartcase,
  command = "set noignorecase",
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dbout",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "snacks_win",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})
