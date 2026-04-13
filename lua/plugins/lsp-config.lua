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
      },
    },
  },

  -- Configuración de los servidores en lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = { "clangd", "--background-index", "--clang-tidy" },
          capabilities = {
            offsetEncoding = { "utf-16" }, -- Fix común para errores de codificación en C++
          },

          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "Makefile",
              "configure.ac",
              "configure.in",
              "config.h.in",
              "compile_commands.json",
              "compile_flags.txt",
              ".git"
            )(fname) or vim.loop.os_homedir()
          end,
        },
        -- Los demás servidores se configuran automáticamente por LazyVim
        pyright = {},
        tsserver = {},
        rust_analyzer = {},
        jdtls = {},
      },
    },
  },
}
