return {
  -- Configuración de Mason para asegurar que se instalen los servidores
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Python
        "pyright",
        -- JS/TS
        "typescript-language-server",
        -- Rust (LazyVim recomienda usar el plugin de rust-tools, pero esto lo instala)
        "rust-analyzer",
        -- Java
        "jdtls",
        -- C++ (Recuerda que en Alpine lo instalamos por APK, pero Mason lo registra)
        "clangd",
      },
    },
  },

  -- Configuración de los servidores en lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        tsserver = {},
        rust_analyzer = {},
        jdtls = {},
        clangd = {
          -- IMPORTANTE: Para que funcione en Alpine con el comando del sistema
          cmd = { "clangd", "--background-index", "--clang-tidy" },
        },
      },
    },
  },
}
