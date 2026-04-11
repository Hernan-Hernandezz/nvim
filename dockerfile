# Imagen base ultra ligera
FROM alpine:latest

# 1. Instalar dependencias esenciales para Neovim y desarrollo
RUN apk add --no-cache \
    neovim \
    git \
    curl \
    build-base \
    unzip \
    nodejs \
    npm \
    python3 \
    py3-pip \
    bash \
    stdc++ \
    g++ \
    gcompat  # Añadido para compatibilidad con LSPs de Mason en Alpine

# 2. Configurar directorios
RUN mkdir -p /root/.config /workspace
WORKDIR /workspace

# 3. Script de arranque inteligente
# Se encarga de clonar tu repo de GitHub o actualizarlo si ya existe
RUN echo -e '#!/bin/bash \n\
if [ ! -d "/root/.config/nvim" ]; then \n\
  echo "📥 Descargando configuración de Hernan-Hernandezz..." \n\
  git clone https://github.com/Hernan-Hernandezz/nvim.git /root/.config/nvim \n\
else \n\
  echo "🔄 Sincronizando cambios de configuración..." \n\
  cd /root/.config/nvim && git pull \n\
fi \n\
nvim "$@"' > /usr/local/bin/entrypoint.sh && chmod +x /usr/local/bin/entrypoint.sh

# 4. Iniciar el script al arrancar el contenedor
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
