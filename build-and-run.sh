#!/bin/bash

# Nombre de tu imagen personalizada
IMAGE_NAME="mi-neovim-terminal"

echo "🚀 Construyendo tu entorno de Neovim..."
docker build -t $IMAGE_NAME .

echo "✅ Entorno listo. Entrando al editor..."
# El flag -v permite que lo que hagas en la carpeta actual se guarde en tu PC real
docker run -it --rm \
  -v $(pwd):/workspace \
  $IMAGE_NAME
