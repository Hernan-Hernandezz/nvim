-- 1. Cargar lazy.nvim y la estructura de LazyVim
require("config.lazy")

-- 2. Cargar el archivo de tema usando una ruta absoluta
-- Esto asegura que encuentre theme.vim sin importar desde qué carpeta abras nvim
local theme_path = vim.fn.stdpath("config") .. "/theme.vim"

if vim.loop.fs_stat(theme_path) then
  vim.cmd("source " .. theme_path)
else
  print("⚠️ No se encontró theme.vim en: " .. theme_path)
end
