return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-t>]], -- Ctrl + t para abrir/cerrar
        direction = "tab", -- Puede ser 'horizontal', 'vertical' o 'float'
      })
    end,
  },
}
