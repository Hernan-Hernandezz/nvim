return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      -- 🔧 Formateadores por tipo de archivo
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        markdown = { "prettier" },
        vue = { "prettier" },
        svelte = { "prettier" },
      },

      -- ⚡ Formatear automáticamente al guardar
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end,
}
