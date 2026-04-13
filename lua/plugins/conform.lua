return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      -- 💡 Para C++ usamos clang-format (ya lo tienes en Alpine)
      cpp = { "clang-format" },
      rust = { "rustfmt" },
    },
    -- Configuración para formatear automáticamente al guardar
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
