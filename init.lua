local set = vim.o
set.number = true
set.relativenumber = true
set.clipboard = "unnamed"

-- 在 copy 后高亮
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			timeout = 300,
		})
	end,
})

-- keybindings
vim.g.mapleader = ";"
local opt = { noremap = true, silent = true }

vim.keymap.set("n", "<C-h>", "<C-w>h", opt)
vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
vim.keymap.set("n", "<C-k>", "<C-w>k", opt)
vim.keymap.set("n", "<C-l>", "<C-w>l", opt)

vim.keymap.set("i", "jk", "<esc>", opt)
vim.keymap.set("n", "<space>", ":", opt)

vim.keymap.set("n", "<leader>b", "<C-w>s", opt)
vim.keymap.set("n", "<leader>v", "<C-w>v", opt)

vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true})
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true})

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- colorscheme
  { "catppuccin/nvim", name = "catppuccin", lazy = true},
  -- telescope
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.1",
      dependencies = { "nvim-lua/plenary.nvim" },
      cmd = "Telescope",
      keys = {
	{"<leader>ff", ":Telescope find_files<CR>", desc = "find_files"},
	{"<leader>fg", ":Telescope live_grep<CR>", desc = "live_grep"},
	{"<leader>fb", ":Telescope buffers<CR>", desc = "buffers"}
      }
  },
  -- LSP
  {
    "williamboman/mason.nvim",
      build = ":MasonUpdate", -- :MasonUpdate updates registry contents
      event = "VeryLazy",
      dependencies = { "williamboman/mason-lspconfig.nvim" },
  },
  { "neovim/nvim-lspconfig",
      event = "VeryLazy",
      dependencies = { "williamboman/mason-lspconfig.nvim" },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
	    "neovim/nvim-lspconfig",
	    "hrsh7th/cmp-nvim-lsp",
	    "hrsh7th/cmp-buffer",
	    "hrsh7th/cmp-path",
	    "hrsh7th/cmp-cmdline",
	    "L3MON4D3/LuaSnip"
    }
  }
  })

-- colorscheme config
vim.cmd.colorscheme("catppuccin-frappe")

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP config
local lspconfig = require('lspconfig')
require("mason").setup()
require("mason-lspconfig").setup()
lspconfig.lua_ls.setup {
  capabilities = capabilities
}

-- Set up nvim-cmp.
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
	require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
      -- they way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-c>'] = cmp.mapping.abort(),
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        else
          fallback()
        end
      end,
      s = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline({
  }),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
