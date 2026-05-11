local palette = require("catppuccin.palettes").get_palette("frappe")
local utils = require("heirline.utils")
local conditions = require("heirline.conditions")
local colors = {
  diag_warn = utils.get_highlight("DiagnosticWarn").fg,
  diag_error = utils.get_highlight("DiagnosticError").fg,
  diag_hint = utils.get_highlight("DiagnosticHint").fg,
  diag_info = utils.get_highlight("DiagnosticInfo").fg,
}
local dim_color = palette.surface0

local M = {}
M.DimSpacer = { provider = " ", hl = { bg = dim_color } }
M.Spacer = { provider = " " }
M.Fill = { provider = "%=" }
M.Percentage = {
  {
    provider = "",
    hl = { fg = dim_color, bg = palette.mantle },
  },
  {
    -- %P = percentage through file of displayed window
    provider = " %P ",
    hl = { fg = palette.blue, bg = dim_color },
  },
}
M.Cursor = {
  {
    provider = "",
    hl = { fg = palette.blue, bg = dim_color },
  },
  {
    -- %c = column number
    -- %l = current line number
    -- %L = number of lines in the buffer
    provider = "%4l,%-3c",
    hl = { fg = palette.base, bg = palette.blue },
  },
}

-- mode
M.Mode = {
  init = function(self)
    self.mode = vim.fn.mode(1)
  end,
  static = {
    mode_names = { -- change the strings if you like it vvvvverbose!
      n = "NORMAL",
      no = "?",
      nov = "?",
      noV = "?",
      ["no\22"] = "?",
      niI = "i",
      niR = "r",
      niV = "Nv",
      nt = "N-TERM",
      v = "VISUAL",
      vs = "Vs",
      V = "V-LINE",
      Vs = "Vs",
      ["\22"] = "VBLOCK",
      ["\22s"] = "\\",
      s = "SELECT",
      S = "S-LINE",
      ["\19"] = "^S",
      i = "INSERT",
      ic = "Ic",
      ix = "Ix",
      R = "RPLACE",
      Rc = "Rc",
      Rx = "Rx",
      Rv = "V-RPLC",
      Rvc = "Rv",
      Rvx = "Rv",
      c = "COMMAND",
      cv = "Ex",
      r = "...",
      rm = "M",
      ["r?"] = "?",
      ["!"] = "!",
      t = "TERM",
    },
    mode_colors = {
      n = palette.blue,
      nt = palette.blue,

      i = palette.green,
      v = palette.mauve,
      V = palette.mauve,
      ["\22"] = palette.mauve,
      c = palette.red,
      s = palette.pink,
      S = palette.pink,
      ["\19"] = palette.pink,
      R = palette.peach,
      r = palette.peach,
      ["!"] = palette.red,
      t = palette.green,
    },
  },
  provider = function(self)
    return " " .. "%1(" .. self.mode_names[self.mode] .. "%)" .. " "
  end,
  hl = function(self)
    local mode = self.mode:sub(1, 1) -- get only the first mode character
    return { fg = palette.base, bg = self.mode_colors[mode], bold = true }
  end,
  update = {
    "ModeChanged",
    pattern = "*:*",
    callback = vim.schedule_wrap(function()
      pcall(vim.cmd, "redrawstatus")
    end),
  },
  {
    provider = "",
    hl = function(self)
      local mode = self.mode:sub(1, 1) -- get only the first mode character
      return { fg = self.mode_colors[mode], bg = dim_color, bold = true }
    end,
  },
} -- mode

-- Git
M.Git = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.is_tracked = self.status_dict.added ~= nil
    self.has_changes = self.is_tracked
        and (self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0)
      or false
  end,

  hl = { fg = palette.blue, bg = dim_color },

  M.DimSpacer,
  { -- git branch name
    provider = function(self)
      return "󰘬 " .. self.status_dict.head
    end,
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = "(",
  },
  { -- git add
    condition = function(self)
      return self.has_changes
    end,
    provider = function(self)
      local count = self.status_dict.added
      return count > 0 and ("+" .. count)
    end,
    hl = { fg = palette.green },
  },
  { -- git removed
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and ("-" .. count)
    end,
    hl = { fg = palette.red },
  },
  { -- git changed
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and ("~" .. count)
    end,
    hl = { fg = palette.yellow },
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = ")",
  },
  M.DimSpacer,
  {
    provider = "",
  },
} -- git

-- Dianostics
M.Diagnostics = {
  condition = conditions.has_diagnostics,
  static = {
    error_icon = "" .. " ",
    warn_icon = "" .. " ",
    info_icon = "" .. " ",
    hint_icon = "" .. " ",
  },

  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,

  update = { "DiagnosticChanged", "BufEnter" },

  {
    provider = function(self)
      -- 0 is just another output, we can decide to print it or not!
      return self.errors > 0 and (" " .. self.error_icon .. self.errors)
    end,
    hl = { fg = colors.diag_error },
  },
  {
    provider = function(self)
      return self.warnings > 0 and (" " .. self.warn_icon .. self.warnings)
    end,
    hl = { fg = colors.diag_warn },
  },
  {
    provider = function(self)
      return self.info > 0 and (" " .. self.info_icon .. self.info)
    end,
    hl = { fg = colors.diag_info },
  },
  {
    provider = function(self)
      return self.hints > 0 and (" " .. self.hint_icon .. self.hints)
    end,
    hl = { fg = colors.diag_hint },
  },
} -- Diagnostics

-- Debugger
M.Debugger = {
  condition = function(self)
    local ok, dap = pcall(require, "dap")
    self.dap = dap
    if ok then
      local session = dap.session()
      return session ~= nil
    end
    return false
  end,
  {
    provider = "",
    hl = { fg = palette.green },
    on_click = {
      callback = function(self)
        self.dap.continue()
      end,
      name = "heirline_debug_continue",
    },
    M.Spacer,
  },
  {
    provider = "",
    hl = { fg = palette.blue },
    on_click = {
      callback = function(self)
        self.dap.step_into()
      end,
      name = "heirline_debug_step_into",
    },
    M.Spacer,
  },
  {
    provider = "",
    hl = { fg = palette.blue },
    on_click = {
      callback = function(self)
        self.dap.step_over()
      end,
      name = "heirline_debug_step_over",
    },
    M.Spacer,
  },
  {
    provider = "",
    hl = { fg = palette.blue },
    on_click = {
      callback = function(self)
        self.dap.step_out()
      end,
      name = "heirline_debug_step_out",
    },
    M.Spacer,
  },
  {
    provider = "",
    hl = { fg = palette.green },
    on_click = {
      callback = function(self)
        self.dap.restart()
      end,
      name = "heirline_debug_restart",
    },
    M.Spacer,
  },
  {
    provider = "",
    hl = { fg = palette.red },
    on_click = {
      callback = function(self)
        self.dap.terminate()
      end,
      name = "heirline_debug_terminate",
    },
    M.Spacer,
  },
} -- Debugger

M.FileIcon = {
  condition = function(self)
    return vim.fn.fnamemodify(self.filename, ":.") ~= ""
  end,
  init = function(self)
    -- self.is_modified = vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    local icon, hl, _ = MiniIcons.get("file", "file." .. extension)

    local bt = vim.api.nvim_get_option_value("buftype", { buf = self.bufnr }) or nil
    if bt and bt == "terminal" then
      icon = ""
    end
    self.icon = icon
    self.icon_color = string.format("#%06x", vim.api.nvim_get_hl(0, { name = hl })["fg"])
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end,
}
-- we redefine the filename component, as we probably only want the tail and not the relative path
M.FileName = {
  init = function(self)
    self.is_modified = vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    local _, hl, _ = MiniIcons.get("file", "file." .. extension)
    self.icon_color = string.format("#%06x", vim.api.nvim_get_hl(0, { name = hl })["fg"])
  end,
  provider = function(self)
    -- self.filename will be defined later, just keep looking at the example!
    local filename = self.filename
    filename = filename == "" and vim.bo.filetype or vim.fn.fnamemodify(filename, ":t")
    filename = self.is_modified and filename .. " [+]" or filename
    return "" .. filename .. ""
  end,
  hl = function(self)
    return {
      italic = self.is_modified,
    }
  end,
}

M.FileType = {
  init = function(self)
    local bufnr = self.bufnr and self.bufnr or 0
    self.filename = vim.api.nvim_buf_get_name(bufnr)
  end,
  {
    provider = " ",
  },
  M.FileIcon,
  {
    provider = function()
      return vim.bo.filetype
    end,
    M.Spacer,
  },
}

M.FileNameBlock = {
  -- condition = exclude_filetypes,
  init = function(self)
    local bufnr = self.bufnr and self.bufnr or 0
    self.filename = vim.api.nvim_buf_get_name(bufnr)
  end,
  hl = { fg = palette.text, bg = dim_color },
  M.DimSpacer,
  M.FileIcon,
  M.FileName,
  M.DimSpacer,
  {
    provider = "",
    hl = { fg = dim_color, bg = palette.mantle },
  },
  -- M.FileFlags,
}

M.SearchOccurrence = {
  condition = function()
    return vim.v.hlsearch == 1
  end,
  hl = { fg = palette.sky },
  provider = function()
    local sinfo = vim.fn.searchcount({ maxcount = 0 })
    local search_stat = sinfo.incomplete > 0 and "  [?/?]"
      or sinfo.total > 0 and ("  [%s/%s]"):format(sinfo.current, sinfo.total)
      or ""
    return search_stat
  end,
}

M.Lsp = {
  provider = function()
    return require("lsp-progress").progress()
  end,
  update = {
    "User",
    pattern = "LspProgressStatusUpdated",
    callback = vim.schedule_wrap(function()
      vim.cmd("redrawstatus")
    end),
  },
  hl = { fg = palette.text, bold = false },
  M.Spacer,
}

return M

-- overseer
-- local function OverseerTasksForStatus(st)
--   return {
--     condition = function(self)
--       return self.tasks[st]
--     end,
--     provider = function(self)
--       return string.format("%s%d", self.symbols[st], #self.tasks[st])
--     end,
--     hl = function(_)
--       return {
--         fg = utils.get_highlight(string.format("Overseer%s", st)).fg,
--       }
--     end,
--   }
-- end

-- M.Overseer = {
--   condition = function()
--     return package.loaded.overseer
--   end,
--   init = function(self)
--     local tasks = require("overseer.task_list").list_tasks({ unique = true })
--     local tasks_by_status = require("overseer.util").tbl_group_by(tasks, "status")
--     self.tasks = tasks_by_status
--   end,
--   static = {
--     symbols = {
--       ["CANCELED"] = " 􀕧 ",
--       ["FAILURE"] = " 􀁐 ",
--       ["SUCCESS"] = " 􀁢 ",
--       ["RUNNING"] = " 􁾤 ",
--     },
--   },
--   M.RightPadding(OverseerTasksForStatus("CANCELED")),
--   M.RightPadding(OverseerTasksForStatus("RUNNING")),
--   M.RightPadding(OverseerTasksForStatus("SUCCESS")),
--   M.RightPadding(OverseerTasksForStatus("FAILURE")),
-- }

-- M.FilePathBlock = {
--   init = function(self)
--     local bufnr = self.bufnr and self.bufnr or 0
--     self.filename = vim.api.nvim_buf_get_name(bufnr)
--   end,
--   hl = { fg = palette.text },
--   M.FileIcon,
--   M.FileName,
--   M.FileFlags,
-- }
--
-- -- we redefine the filename component, as we probably only want the tail and not the relative path
-- M.FilePath = {
--   provider = function(self)
--     -- first, trim the pattern relative to the current directory. For other
--     -- options, see :h filename-modifers
--     local filename = vim.fn.fnamemodify(self.filename, ":.")
--     if filename == "" then
--       return vim.bo.filetype ~= "" and vim.bo.filetype or vim.bo.buftype
--     end
--     -- now, if the filename would occupy more than 1/4th of the available
--     -- space, we trim the file path to its initials
--     -- See Flexible Components section below for dynamic truncation
--     -- if not conditions.width_percent_below(#filename, 0.25) then
--     --   filename = vim.fn.pathshorten(filename, 4)
--     -- end
--     return filename
--   end,
--   hl = function(self)
--     return {
--       fg = self.is_active and palette.text or palette.subtext0,
--       bold = self.is_active or self.is_visible,
--       italic = self.is_active,
--     }
--   end,
-- }
--
-- this looks exactly like the FileFlags component that we saw in
-- #crash-course-part-ii-filename-and-friends, but we are indexing the bufnr explicitly
-- also, we are adding a nice icon for terminal buffers.
-- M.FileFlags = {
--   {
--     init = function(self)
--       local filename = self.filename
--       local extension = vim.fn.fnamemodify(filename, ":e")
--       local _, hl, _ = MiniIcons.get("file", "file." .. extension)
--       self.icon_color = string.format("#%06x", vim.api.nvim_get_hl(0, { name = hl })["fg"])
--
--       -- local extension = vim.fn.fnamemodify(filename, ":e")
--       -- local _, hl = require("nvim-web-devicons").get_icon(self.filename, extension)
--       -- self.icon_color = string.format("#%06x", vim.api.nvim_get_hl(0, { name = hl })["fg"])
--     end,
--     condition = function(self)
--       local ignored_filetypes = {
--         "dap-repl",
--       }
--       local result = vim.fn.fnamemodify(self.filename, ":.") ~= ""
--         and vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
--       local ft = vim.api.nvim_get_option_value("buftype", { buf = self.bufnr })
--       if vim.tbl_contains(ignored_filetypes, ft) then
--         result = false
--       end
--       return result
--     end,
--     provider = " 􀴥 ",
--     hl = function(self)
--       return { fg = self.icon_color, bold = self.is_active }
--     end,
--   },
--   {
--     condition = function(self)
--       return not vim.api.nvim_get_option_value("modifiable", { buf = self.bufnr })
--         or vim.api.nvim_get_option_value("readonly", { buf = self.bufnr })
--     end,
--     provider = function(self)
--       if vim.api.nvim_get_option_value("buftype", { buf = self.bufnr }) == "terminal" then
--         return ""
--       else
--         return " "
--       end
--     end,
--     hl = { fg = palette.text },
--   },
-- }
--
