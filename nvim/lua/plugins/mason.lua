local plugin = "mason.nvim"

return {
  "mason-org/" .. plugin,
  cmd = "Mason",
  opts = function(_, opts)
    opts.ui = {
      border = "double",
      icons = {
        package_installed = "﫟",
        package_pending = "﫠",
        package_uninstalled = "",
      },
    }
    opts.ensure_installed = {
      "bash-language-server",
      "flake8",
      "gopls",
      "html-lsp",
      "fixjson",
      "lua-language-server",
      "groovy-language-server",
      "rust-analyzer",
      "shellcheck",
      "shfmt",
      "sqlls",
      "stylua",
      "elixir-ls",
      "protolint",
      "buf",
    }
  end,
}
