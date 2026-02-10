---@type LazySpec
return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "goimports", "gofumpt" },
      python = { "isort", "black" },
      javascript = { "biome", "prettier", stop_after_first = true },
      typescript = { "biome", "prettier", stop_after_first = true },
      javascriptreact = { "biome", "prettier", stop_after_first = true },
      typescriptreact = { "biome", "prettier", stop_after_first = true },
      json = { "biome", "prettier", stop_after_first = true },
      jsonc = { "biome", "prettier", stop_after_first = true },
      html = { "prettier" },
      css = { "prettier" },
      markdown = { "prettier" },
      yaml = { "prettier" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      zsh = { "shfmt" },
      c = { "clang-format" },
      cpp = { "clang-format" },
    },
    format_on_save = {
      timeout_ms = 3200,
      lsp_format = "fallback",
    },
  },
}
