local ensure_installed = {
  c = {
    lsp = "clangd",
    dap = { "cpptools", "codelldb" },
    formatter = "clang-format",
  },
  rust = {
    lsp = "rust-analyzer",
    dap = "codelldb",
  },
  python = {
    lsp = "basedpyright",
    dap = "debugpy",
    formatter = "black",
  },
  lua = {
    lsp = "lua-language-server",
    formatter = "stylua",
  },
  bash = {
    lsp = "bash-language-server",
    linter = "shellcheck",
    formatter = "shfmt",
  },
  toml = {
    lsp = "taplo",
  },
}

vim.api.nvim_create_user_command("EusureInstalled", function(_)
  local packages = {}
  local languages = {}

  for lang, config in pairs(ensure_installed) do
    table.insert(languages, lang)
    for _, item in pairs(config) do
      local list = type(item) == "table" and item or { item }
      for _, name in pairs(list) do
        packages[name] = true
      end
    end
  end

  -- install lsp and so on
  local mr = require("mason-registry")
  for pkg_name, _ in pairs(packages) do
    local p = mr.get_package(pkg_name)
    if not p:is_installed() then
      print(string.format("[Mason] Installing %s...", pkg_name))
      p:install()
    end
  end

  -- install treesitter parser
  require("nvim-treesitter").install(languages)
end, {})
